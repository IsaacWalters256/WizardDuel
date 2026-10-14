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

func _process(delta: float) -> void:
	if chra.players[chra.owner_id][4][1] == "keyboard":
		if Input.is_action_just_pressed("left"):
			if chra.facing_right == true:
				chra.swap_direction()
			chra.change_state("moving")
		elif Input.is_action_just_released("left"):
			if chra.facing_right == false:
				chra.change_state("idle")
		elif Input.is_action_just_pressed("right"):
			if chra.facing_right == false:
				chra.swap_direction()
			chra.change_state("moving")
		elif Input.is_action_just_released("right"):
			if chra.facing_right == true:
				chra.change_state("idle")
