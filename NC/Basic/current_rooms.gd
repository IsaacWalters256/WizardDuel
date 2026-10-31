extends Node2D

#going to store them vertically upwards past the edge of the screen
var difficulty = 0
var locked = false

var main
var pauser

func start(main_ref,pauser_ref):
	main = main_ref
	pauser = pauser_ref

func enter_room(which):
	if which == true:
		pass

func exit_room():
	pass#put current room back up
