extends Sprite2D

var tween

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.position.move_toward(Vector2(100,0), 1)
	#global position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	self.global_position = self.global_position.move_toward(Vector2(100,0), 1 * delta)
