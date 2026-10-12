extends Node2D

#index, wizard type, camera ref, unit ref
var players = [[0,"wizard",null,null]]

func start():
	get_node("ControllerCenter").start()
	get_node("CharacterCreation").start()

func creation_done(new_players):
	players = new_players
	load_game()

func load_game():
	get_node("Map").start()
	

@onready var add_to_split_screen = [get_node("PCVV/PCVH1"),get_node("PCVV/PCVH2"),get_node("PCVV/PCVH3"),get_node("PCVV/PCVH1"),get_node("PCVV/PCVH2"),get_node("PCVV/PCVH3"),]

func load_cameras():
	for p in players.size():
		var new_pvc = load("res://NC/Basic/pvc.tscn").instantiate()
		add_to_split_screen[p].add_child(new_pvc)
		#TODO update the pcv sizes too
		players[p][2] = new_pvc.get_node("PV/PC")
		players[p][2].follow_target = players[p][3]
		players[p][2].position = players[p][3].position
	get_node("SubViewportContainer/SubViewport").world_2d = get_node("Map")
