extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Master/OtherMain").start()
	get_node("Master/Pauser").position = get_node("Master/OtherMain/Clock").get_global_position()
