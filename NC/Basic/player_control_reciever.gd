extends Node2D

@onready var chra = get_parent().get_parent()

func start():
	chra.players[chra.owner_id][5] = self

#func passed_input(event):
	#event.is_action
	#if event.is("left"):
		#if chra.facing_right == true:
			#chra.swap_direction()
		#chra.moving = true
	#if event.is_action_just_released("left"):
		#chra.moving = false

var current_direction_input = "none"
var recent_list#appending the directions here so that we can idk

func new_command(command):
	if command == "left_pressed":
		current_direction_input = "left"
		chra.swap_direction("left")
		chra.change_state("moving")
	elif command == "right_pressed":
		current_direction_input = "right"
		chra.swap_direction("right")
		chra.change_state("moving")
	elif command == "up_pressed":
		current_direction_input = "up"
		chra.swap_direction("up")
		chra.change_state("moving")
	elif command == "down_pressed":
		current_direction_input = "down"
		chra.swap_direction("down")
		chra.change_state("moving")
	elif command == "left_released":
		if current_direction_input == "left":
			chra.change_state("idle")
	elif command == "right_released":
		if current_direction_input == "right":
			chra.change_state("idle")
	elif command == "up_released":
		if current_direction_input == "up":
			chra.change_state("idle")
	elif command == "down_released":
		if current_direction_input == "down":
			chra.change_state("idle")
