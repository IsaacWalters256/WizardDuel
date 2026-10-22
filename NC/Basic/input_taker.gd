extends Node2D




func _process(delta: float) -> void:
	if Input.is_action_just_pressed("pause_game"):
		get_parent().get_node("Pauser").pause_all(!get_parent().get_node("Pauser").paused)
