extends Node2D

var typing = null
var owner_id = null
var facing_right = true
var state = "idle"
var move_locked = false
var delta_multa = 10
var players
var z_value = 5

var current_ani = "idle"
var current_frame = 0
var loop_ani = false

var assignment = "guard"
var current_action = "guard"

#animations
#ai actions

func start(owner_id_ref,players_ref):
	players = players_ref
	owner_id = owner_id_ref
	typing.start(owner_id,players)

func swap_direction():
	facing_right = !facing_right
	self.scale.x = -self.scale.x

func change_state(new_state_request):
	if new_state_request == "idle":
		state = "idle"
		new_ani("idle")
	elif new_state_request == "moving":
		state = "moving"
		new_ani("move")

func new_ani(ani):
	current_ani = ani
	current_frame = 0
	loop_ani = false
	next_ani_frame()

func next_ani_frame():
	#print("___")
	#print(typing.anis[current_ani].size())
	#print(current_frame)
	if current_frame < typing.anis[current_ani].size()-1:
		current_frame = current_frame + 1
		if typing.anis[current_ani][current_frame].has("an"):
			typing.get_node("Sprite2D").frame = typing.anis[current_ani][current_frame]["an"]
		if typing.anis[current_ani][current_frame].has("loop"):
			loop_ani = true
		if typing.anis[current_ani][current_frame].has("move"):
			if (typing.anis[current_ani][current_frame]["move"][0] == "for" && facing_right) || (typing.anis[current_ani][current_frame]["move"][0] == "bac" && !facing_right):
				self.position.x = self.position.x + typing.anis[current_ani][current_frame]["move"][1]
			else:
				self.position.x = self.position.x - typing.anis[current_ani][current_frame]["move"][1]
	else:
		if loop_ani == true:
			new_ani(current_ani)
		else:
			end_ani()

func end_ani():
	pass#current_frame = 0

func _process(delta: float) -> void:
	pass
	#if move_locked == false:
		#if state == "moving":
			#if facing_right:
				#self.position.x = self.position.x + (speed * delta * delta_multa)
			#else:
				#self.position.x = self.position.x - (speed * delta * delta_multa)
