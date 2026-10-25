extends Node2D



var cursor_options = {
	"default": load("res://Art/UISprites/Franuka/1x/Cursors/Gauntlet.png")
}

func change_icon(new):
	get_node("Sprite2D").texture = cursor_options[new]

func start():
	self.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _process(delta: float) -> void:
	self.position = get_global_mouse_position()
