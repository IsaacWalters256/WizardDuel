extends Node2D


func start():#currently not triggering
	pass


func create_unit(type):
	var new_unit = load("res://NC/Basic/unit.tscn").instantiate()
	new_unit.type = type
	var u_sprite = load(unit_types[type]).instantiate()
	new_unit.start(u_sprite,get_parent().pauser)
	return new_unit




#i guess we don't need a function to make a unit, just need to deep copy from here
var unit_types = {
	"Swordsman": "res://NC/Units/swordsman.tscn",
	"Orc": "res://NC/Units/orc.tscn",
}



#heart 0, spade 1, diamond 2, club 3
var room_groups = [
	[
		[],#jokers are treasure chests that need to be placed
		[["unit name","location MidMid"]],
		
	]
]
