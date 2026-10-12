extends Camera2D

var follow_target = self

func _process(delta: float) -> void:
	self.position = follow_target.position
