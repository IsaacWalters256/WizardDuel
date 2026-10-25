extends Node2D

var current_selected = "none"
var current_selected_ref = self
#seperate by underscore friendly_unit_lancer
#choice_lancer

#This node is going to handle all ui and player inputs basically


var cursor_options = {
	"default": load("res://Art/UISprites/Franuka/1x/Cursors/Gauntlet.png"),
	"select": load("res://Art/UISprites/Franuka/1x/Cursors/Gauntlet_Magic.png"),
	"trade": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Trade.png"),
	"book": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Spell.png"),
	"gear": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Settings.png"),
	"boot": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Move.png"),
	"envelope": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Message.png"),
	"look": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Inspect.png"),
	"dialog": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Dialog.png"),
	"dagger": load("res://Art/UISprites/Franuka/1x/Cursors/Command_Attack.png"),
}

func start():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	change_icon("default")

func change_icon(new):
	get_node("Sprite2D").texture = cursor_options[new]

func _process(delta: float) -> void:
	self.position = get_global_mouse_position()
	if Input.is_action_just_pressed("select"):
		if current_selected == "map_card":
			get_parent().enter_card(current_selected_ref.get_parent())
		#check if status is locked again on click
	elif Input.is_action_just_pressed("look"):
		print("look")




func _on_area_2d_area_entered(area: Area2D) -> void:
	var what_is = area.get_parent().what_is
	if what_is == "map_card":
		if area.get_parent().status == "unlocked":
			current_selected_ref = area
			change_icon("look")
			current_selected = "map_card"

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area == current_selected_ref:
		current_selected = "none"
		change_icon("default")
