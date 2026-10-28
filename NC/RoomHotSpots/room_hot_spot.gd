extends Node2D

var what_is = "room_hot_spot"
var locked = true

@onready var enemy_spot = get_node("InventorySpotEnemy")
@onready var ally_spot = get_node("InventorySpotAlly")
