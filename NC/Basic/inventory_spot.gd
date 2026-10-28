extends Node2D

var what_is = "inventory_spot"
@export var what_to_hold = "unit"
var holding = null
var locked = false

func add_holding(adding,thing=null):
	if adding:
		if thing.get_parent():
			thing.reparent(get_node("Held"))
			thing.held_by.add_holding(false)
		else:
			get_node("Held").add_child(thing)
		thing.held_by = self
		holding = thing
	else:
		#get_node("Held").remove_child(holding)
		holding = null
