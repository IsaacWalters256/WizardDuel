extends Sprite2D

var page_name = "Spells"

@export var previous_page = Node2D
@export var next_page = Node2D

func start(player_ref):
	get_node("RefBook").visible = false

func new_input(type):
	pass

func focused(yes):
	pass
