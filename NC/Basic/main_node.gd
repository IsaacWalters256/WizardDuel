extends Node2D

var players = []

func start():
	get_node("ControllerCenter").start()
	get_node("CharacterCreation").start()

func creation_done(new_players):
	players = new_players
	load_game()

func load_game():
	pass
