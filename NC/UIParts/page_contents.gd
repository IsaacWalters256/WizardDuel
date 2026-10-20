extends Sprite2D

var page_name = "Contents"
@export var previous_page = Node2D
@export var next_page = Node2D

func start(player_ref):
	get_node("RefBook").visible = false
	for p in get_parent().get_children():
		print(p.page_name)

func new_input(type):
	pass

func focused(yes):
	pass
