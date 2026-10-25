extends Node2D





func start():
	#self.visible = true
	pass#Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	self.position = get_global_mouse_position()
