extends Node2D

#bottom to top
var card_order = []
var locked = false
@export var save_cards_to = Node2D
@export var draw_to = Node2D

func start(contents):
	card_order = contents

func in_focus(focused):
	get_node("1By1").visible = focused

func draw_card(from_top):
	pass


func _on_button_button_down() -> void:
	in_focus(true)

func _on_button_button_up() -> void:
	in_focus(false)
	draw_card(true)



func _on_button_mouse_entered() -> void:
	if locked == false:
		in_focus(true)

func _on_button_mouse_exited() -> void:
	if locked == false:
		in_focus(false)
