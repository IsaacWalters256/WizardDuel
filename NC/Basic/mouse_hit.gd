extends Node2D

var what_is = "mouse"
var current_selected = "none"
var current_selected_ref = self
@onready var held = get_node("HeldObject")
#seperate by underscore friendly_unit_lancer
#choice_lancer

#This node is going to handle all ui and player inputs basically

var current_areas = {
	
}

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

var main
var pauser

func start(main_ref,pauser_ref):
	main = main_ref
	pauser = pauser_ref
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	change_icon("default")

func change_icon(new):
	get_node("Sprite2D").texture = cursor_options[new]



#change from just pressed to just clicked to start to loading tween that moves it closer
#and just released to activate the command itself, if tween is finished it does the secondary command
func _process(delta: float) -> void:
	self.position = get_global_mouse_position()
	if Input.is_action_just_pressed("select"):
		if current_selected == "summon_map":
			
		
		#if current_selected == "map_card":
			#get_parent().enter_card(current_selected_ref.get_parent())
			#change_icon("default")
		##check if status is locked again on click
		#elif current_selected == "map_deck":
			#get_parent().ucp("start_game")
		#elif current_selected == "room_edge":
			#change_icon("default")
			#get_parent().exit_room()
		#elif current_selected == "friendly_unit":
			#held.add_holding(true,current_selected_ref.get_parent())
			#change_icon("default")
		#elif current_selected == "can_place_unit_here":
			#current_selected_ref.get_parent().held.add_holding(true,held.holding)
			#change_icon("default")
		#elif current_selected == "can_place_unit_here_battle":
			#current_selected_ref.get_parent().held_ally.add_holding(true,held.holding)
			#change_icon("default")
		#current_selected = "none"
	#elif Input.is_action_just_pressed("look"):
		#print("look")


func update_selected(new_selection):
	var current_selected = current_areas.keys()[0].what_is
	var ap = current_areas.keys()[0]
	if new_selection:
		ap = new_selection
		what_is = new_selection.what_is
	
	if current_selected == "summon_map":
		current_selected_ref = ap
		change_icon("look")
	
	#if what_is == "map_card":
		#if area.get_parent().face_down == false && area.get_parent().get_parent().get_parent().is_in_room == false:
			#current_selected_ref = area
			#change_icon("look")
			#current_selected = "map_card"
	#elif what_is == "map_deck":
		#current_selected_ref = area
		#change_icon("select")
		#current_selected = "map_deck"
		#get_node("HoverLabel").visible = true
		#get_node("HoverLabel").text = "new game"
	#elif what_is == "room_edge":
		#current_selected_ref = area
		#change_icon("look")
		#current_selected = "room_edge"
	#elif what_is == "unit" && area.get_parent().team == 0 && !held.holding:# != current_selected_ref.get_parent():
		#current_selected_ref = area
		#change_icon("select")
		#current_selected = "friendly_unit"
	#elif what_is == "inventory_spot" && !area.get_parent().locked && !area.get_parent().held.holding && held.holding && held.holding.what_is == "unit" && area.get_parent().what_to_hold == "unit":
		#current_selected_ref = area
		#change_icon("select")
		#current_selected = "can_place_unit_here"
	#elif what_is == "battle_spot" && !area.get_parent().locked && held.holding && held.holding.what_is == "unit" && ((!area.get_parent().held_enemy.holding || held.holding.type == "Swordsman") && !area.get_parent().held_ally.holding):
		#current_selected_ref = area
		#change_icon("select")
		#current_selected = "can_place_unit_here_battle"
	#
	#if area == current_selected_ref:
		#current_selected = "none"
		#change_icon("default")
		#get_node("HoverLabel").visible = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	var what_is = area.get_parent().what_is
	var ap = area.get_parent()
	current_areas[ap] = ap
	update_selected(ap)

func _on_area_2d_area_exited(area: Area2D) -> void:
	update_selected(null)
	
