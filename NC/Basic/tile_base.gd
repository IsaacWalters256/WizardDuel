extends Node2D


#Entering que (one for each doorway) counter that denotes when ani is finished let someone in



var actions = [
	
]

var pos = [0,0]
var typing
var player = [-1]
var what_is = "tile"
var og_tile

var tile_index = [-1,-1]
var exits = {
	"up":"na",
	"down":"na",
	"left":"na",
	"right":"na",
}
var units_here = {}

func start(player_ref,type_name,pos_ref):
	change_owner(player_ref)
	pos = pos_ref
	og_tile = type_name
	
	self.position.x = pos[1]*128
	self.position.y = pos[0]*30
	#self.position.y = pos[0]*128#TODO adjust z value, each tile is 6 z layers
	#back left, units going back, back right, units mid, front left, units front, front right
	
	change_typing(type_name)

func update_position(new_pos):
	pass

func change_owner(new_owner):
	player = new_owner

func change_typing(type_name):
	if typing:
		typing.queue_free()
	typing = load(get_parent().get_parent().tile_dict[type_name]).instantiate()
	self.add_child(typing)
	typing.start()
	
	for u in units_here:
		units_here[u].tile_changed()

func next_ani_frame():
	if typing.has_method("next_ani_frame"):
		typing.next_ani_frame()



func _on_main_area_area_entered(area: Area2D) -> void:
	if area.get_parent().what_is == "unit":
		if !units_here.has(area.get_parent().unique_id):
			units_here[area.get_parent().unique_id] = area.get_parent()
			print(units_here)

func _on_main_area_area_exited(area: Area2D) -> void:
	if area.get_parent().what_is == "unit":
		if units_here.has(area.get_parent().unique_id):
			units_here.erase(area.get_parent().unique_id)
			print(units_here)


func _on_back_z_area_entered(area: Area2D) -> void:
	if area.get_parent().what_is == "unit":
		pass#TODO area.update_z(our_z)


func _on_mid_z_area_entered(area: Area2D) -> void:
	pass #UPDATE Z + TELL THAT IT CAN GO UP OR DOWN 
	#move to the center of this tile, then move to the center of the tile upwards

func _on_mid_z_area_exited(area: Area2D) -> void:
	pass #UPDATE Z + TELL THAT IT CANT GO UP OR DOWN 


func _on_front_z_area_entered(area: Area2D) -> void:
	pass #TODO area.update_z(our_z)
