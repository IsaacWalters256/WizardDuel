extends Node2D

#index, wizard type, camera ref, unit ref
var players = [[0,"wizard",null,null,["player","keyboard"],null],[1,"wizard",null,null,["player","controller1"],null]]
@onready var map = get_node("SubViewport/Map")

func start():
	get_node("ControllerCenter").start()
	get_node("CharacterCreation").start()

func creation_done(new_players):
	players = new_players
	load_game()

func load_game():
	map.start(self)
	load_cameras()

@onready var add_to_split_screen = [get_node("PCVV/PCVH1"),get_node("PCVV/PCVH2"),get_node("PCVV/PCVH3"),get_node("PCVV/PCVH1"),get_node("PCVV/PCVH2"),get_node("PCVV/PCVH3"),]

func load_cameras():
	for p in players.size():
		var new_pvc = load("res://NC/Basic/pvc.tscn").instantiate()
		add_to_split_screen[p].add_child(new_pvc)
		#self.add_child(new_pvc)
		#TODO update the pcv sizes too
		players[p][2] = new_pvc.get_node("PV/PC")
		players[p][2].follow_target = players[p][3]
		#players[p][2].position = players[p][3].position
		new_pvc.get_node("PV").world_2d = get_node("SubViewport").world_2d
		
		if players.size() == 2:
			new_pvc.get_node("PV").size = Vector2(512,150)
		elif players.size() == 3:
			new_pvc.get_node("PV").size = Vector2(512,100)
		elif players.size() == 4:
			new_pvc.get_node("PV").size = Vector2(512,100)
			if p == 0 || p == 3:
				new_pvc.get_node("PV").size = Vector2(256,100)
		elif players.size() == 5:
			new_pvc.get_node("PV").size = Vector2(512,100)
			if p == 0 || p == 3 || p == 1 || p == 4:
				new_pvc.get_node("PV").size = Vector2(256,100)
		elif players.size() == 6:
			new_pvc.get_node("PV").size = Vector2(256,100)
