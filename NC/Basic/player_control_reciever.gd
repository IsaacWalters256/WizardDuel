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

func _process(delta: float) -> void:
	if chra.players[chra.owner_id][4][1] == "keyboard":
		if Input.is_action_just_pressed("left"):
			current_direction_input = "left"
			chra.swap_direction("left")
			chra.change_state("moving")
		elif Input.is_action_just_pressed("right"):
			current_direction_input = "right"
			chra.swap_direction("right")
			chra.change_state("moving")
		elif Input.is_action_just_pressed("up"):
			current_direction_input = "up"
			chra.swap_direction("up")
			chra.change_state("moving")
		elif Input.is_action_just_pressed("down"):
			current_direction_input = "down"
			chra.swap_direction("down")
			chra.change_state("moving")
		
		if Input.is_action_just_released("left"):
			if current_direction_input == "left":
				chra.change_state("idle")
		elif Input.is_action_just_released("right"):
			if current_direction_input == "right":
				chra.change_state("idle")
		elif Input.is_action_just_released("up"):
			if current_direction_input == "up":
				chra.change_state("idle")
		elif Input.is_action_just_released("down"):
			if current_direction_input == "down":
				chra.change_state("idle")
