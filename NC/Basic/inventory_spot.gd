extends Node2D

var what_is = "inventory_spot"
@export var what_to_hold = "unit"
var locked = false
@onready var held = get_node("HeldObject")
