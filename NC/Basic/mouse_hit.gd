extends Node2D

var current_selected = "none"
var current_selected_ref = self
var holding = null
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
			change_icon("default")
		#check if status is locked again on click
		elif current_selected == "map_deck":
			get_parent().ucp("start_game")
		elif current_selected == "room_edge":
			change_icon("default")
			get_parent().exit_room()
		elif current_selected == "friendly_unit":
			add_holding(true,current_selected_ref.get_parent())
			change_icon("default")
		elif current_selected == "can_place_unit_here":
			current_selected_ref.get_parent().add_holding(true,holding)
			change_icon("default")
		current_selected = "none"
	elif Input.is_action_just_pressed("look"):
		print("look")

func add_holding(adding,thing=null):
	if adding:
		if thing.get_parent():
			thing.reparent(get_node("Held"))
			thing.held_by.add_holding(false)
		else:
			get_node("Held").add_child(thing)
		thing.held_by = self
		holding = thing
	else:
		#get_node("Held").remove_child(holding)
		holding = null


func _on_area_2d_area_entered(area: Area2D) -> void:
	var what_is = area.get_parent().what_is
	if what_is == "map_card":
		if area.get_parent().face_down == false && area.get_parent().get_parent().get_parent().is_in_room == false:
			current_selected_ref = area
			change_icon("look")
			current_selected = "map_card"
	elif what_is == "map_deck":
		current_selected_ref = area
		change_icon("select")
		current_selected = "map_deck"
		get_node("HoverLabel").visible = true
		get_node("HoverLabel").text = "new game"
	elif what_is == "room_edge":
		current_selected_ref = area
		change_icon("look")
		current_selected = "room_edge"
	elif what_is == "unit" && area.get_parent().team == 0 && holding != current_selected_ref.get_parent():
		current_selected_ref = area
		change_icon("select")
		current_selected = "friendly_unit"
	elif what_is == "inventory_spot" && !area.get_parent().locked && holding && holding.what_is == "unit" && area.get_parent().what_to_hold == "unit":
		current_selected_ref = area
		change_icon("select")
		current_selected = "can_place_unit_here"

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area == current_selected_ref:
		current_selected = "none"
		change_icon("default")
		get_node("HoverLabel").visible = false
