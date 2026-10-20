extends Node2D

var what_is = "gold_mine"
var player_id = -1
#var sprite_variations = ["res://Art/Tiles/Plains1.png","res://Art/Tiles/Plains2.png","res://Art/Tiles/Plains3.png"]

var counter_max = 40
var counter = 0
var workers = 0
var gold_max = 4
var gold = 0

func start():
	pass
	get_node("BackLeft").texture = ""
	#get_node("Sprite2D").texture = load(sprite_variations.pick_random())


func next_ani_frame():
	counter = counter + workers
	if counter > counter_max:
		counter = 0
		if gold < gold_max:
			gold = gold + 1
