extends Node2D

var player_id = -1
#var sprite_variations = ["res://Art/Tiles/Plains1.png","res://Art/Tiles/Plains2.png","res://Art/Tiles/Plains3.png"]

func start(owner_id_ref):
	player_id = owner_id_ref
	#get_node("Sprite2D").texture = load(sprite_variations.pick_random())
