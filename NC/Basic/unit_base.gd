extends Node2D

var typing = null
var owner_id = null
var direction_facing = "right"
var state = "idle"
var locked = false
var players
var z_value = 24 #out of 48
var anis
var anis_info = ["idle",0]
var graphic = null

var assignment = "guard"
var current_action = "guard"

#animations
#ai actions

func start(owner_id_ref,players_ref):
	players = players_ref
	owner_id = owner_id_ref
	typing.start(owner_id,players)
	anis = typing.anis
	graphic = typing.get_node("Sprite2D")
	update_z(-24)
	

func swap_direction(new_direction):
	direction_facing = new_direction
	if new_direction == "right" || new_direction == "up":
		self.scale.x = 1
	else:
		self.scale.x = -1

func update_z(new_z):
	z_value = new_z
	typing.position.y = z_value
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
	anis_info[1] = 0



func end_ani():
	pass#current_frame = 0
