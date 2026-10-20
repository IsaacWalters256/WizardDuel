extends Node2D

var typing
var player

var direction_facing = "right"
var state = "idle"
var locked = false
var players
var z_value = 0 #out of 40?
var anis
var anis_info = ["idle",0]
var graphic = null
var current_tile = null
var what_is = "unit"
var unique_id = "1"

var assignment = "guard"
var current_action = "guard"

var stats = {
	"coin": [0,3],#current,max
	"mana": [3,3],#current,max
	"heart": [3,3],#current,max
}

#animations
#ai actions

func start(player_ref,type_name,pos,new_id):
	player = player_ref
	unique_id = new_id
	
	self.position.x = pos.x
	update_z(-z_value)
	
	typing = load(get_parent().get_parent().unit_dict[type_name]).instantiate()
	self.add_child(typing)
	typing.start()
	
	anis = typing.anis
	graphic = typing.get_node("Sprite2D")

func change_graphic(new_frame):
	graphic.frame = new_frame

func swap_direction(new_direction):
	direction_facing = new_direction
	if new_direction == "right" || new_direction == "up":
		self.scale.x = 1
	else:
		self.scale.x = -1

func update_z(new_z):
	z_value = new_z
	#typing.position.y = z_value
	self.z_index = z_value

func change_state(new_state_request):
	if new_state_request == "idle":
		state = "idle"
		new_ani("idle")
	elif new_state_request == "moving":
		state = "moving"
		new_ani("move")
	elif new_state_request == "moving_z_up":
		state = "moving_z_up"
		new_ani("move_z_up")
	elif new_state_request == "moving_z_down":
		state = "moving_z_down"
		new_ani("move_z_down")

func new_ani(ani):
	anis_info[0] = ani
	anis_info[1] = -1

func tile_changed():
	print("check")

func end_ani():
	pass#current_frame = 0


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.get_parent().what_is == "tile":
		current_tile = area.get_parent()
	if area.get_parent().player[0] == player[0]:
		if area.get_parent().what_is == "gold_mine":
			var coin_dif = stats["coin"][1] - stats["coin"][0]
			if coin_dif >= area.get_parent().gold:
				stats["coin"][0] = stats["coin"][0] + area.get_parent().gold
				area.get_parent().gold = 0
			else:
				stats["coin"][0] = stats["coin"][1]
				area.get_parent().gold = area.get_parent().gold - coin_dif
			player[6].stats_display.update_stats()
			
