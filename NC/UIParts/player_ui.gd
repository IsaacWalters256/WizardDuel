extends Node2D


#will use the same animation system the players use

#index, wizard type, camera ref, unit ref, control type,pcr
var player
var pcr
var state = "world"

var anis = {}
var anis_info = ["idle",0]
var graphic = null

func start(player_ref):
	player = player_ref
	pcr = player[3].typing.get_node("PlayerControlReciever")
	player[6] = self
	#if real player count is greater than 3, change the positions of things


func _process(delta: float) -> void:
	if player[4][1] == "keyboard":
		if state == "world":
			if Input.is_action_just_pressed("left"):
				pcr.new_command("left_pressed")
				
			elif Input.is_action_just_pressed("right"):
				pcr.new_command("right_pressed")
				
			elif Input.is_action_just_pressed("up"):
				pcr.new_command("up_pressed")
				
			elif Input.is_action_just_pressed("down"):
				pcr.new_command("down_pressed")
				
			if Input.is_action_just_released("left"):
				pcr.new_command("left_released")
				
			elif Input.is_action_just_released("right"):
				pcr.new_command("right_released")
				
			elif Input.is_action_just_released("up"):
				pcr.new_command("up_released")
				
			elif Input.is_action_just_released("down"):
				pcr.new_command("down_released")
				
