extends Node2D

var card_info = []
var face_down = true
var locked = true
var room = null

var what_is = "map_card"

func start(card_info_ref):
	card_info = card_info_ref
	get_node("Front").frame = card_info[0]
	get_node("Back").frame = card_info[1]

func connect_room(room_ref):
	room = room_ref

func movement(type):
	var tween0 = get_parent().get_parent().get_parent().pauser.get_tween(self)
	
	#pass#type can be moving or flipping and moving
	if type[0] == "move_with_bump":
		tween0.tween_property(self, "position", type[1], 1.0)
	elif type[0] == "move_and_flip":
		pass
	elif type[0] == "flip":
		var node_leaving = get_node("Back")
		var node_coming = get_node("Front")
		if !face_down:
			node_leaving = get_node("Front")
			node_coming = get_node("Back")
			locked = true
		else:
			locked = false
		face_down = !face_down
		tween0.tween_property(self, "position", Vector2(self.position.x,self.position.y-5), 0.5)
		tween0.parallel().tween_property(node_leaving, "scale", Vector2(0,self.scale.y), 0.5)
		tween0.tween_property(self, "position", Vector2(self.position.x,self.position.y), 0.5)
		tween0.parallel().tween_property(node_coming, "scale", Vector2(1,self.scale.y), 0.5)
