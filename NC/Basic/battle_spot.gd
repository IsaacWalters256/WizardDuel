extends Node2D


var what_is = "battle_spot"
#@export var what_to_hold = "unit"
var locked = false
@onready var held_ally = get_node("HeldAlly")
@onready var held_enemy = get_node("HeldEnemy")
