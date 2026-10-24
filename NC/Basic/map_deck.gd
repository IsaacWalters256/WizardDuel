extends Node2D



#bottom to top
var card_order = []
var removed_from_deck = []
var locked = false
@export var save_cards_to = Node2D
@export var draw_to = Node2D

func start(contents):
	card_order = contents
	change_our_back()

func change_our_back():
	get_node("DeckSprite").frame = card_order[card_order.size()-1][1]

func in_focus(focused):
	get_node("1By1").visible = focused

func draw_card(from_top,location,save_to,board_spot="na"):
	#if from top == true
	var card_drawn = card_order.pop_back()
	removed_from_deck.append(card_drawn)
	var created_card = load("res://NC/Basic/playing_card.tscn").instantiate()
	created_card.start(card_drawn)
	save_to.add_child(created_card)
	created_card.global_position = self.get_global_position()
	created_card.movement(["move_with_bump",location.get_global_position()])
	
	change_our_back()
	
	if board_spot:
		get_parent().cards[board_spot] = created_card
	
	return created_card


func _on_button_button_down() -> void:
	in_focus(true)

func _on_button_button_up() -> void:
	in_focus(false)
	#draw_card(true)



func _on_button_mouse_entered() -> void:
	if locked == false:
		in_focus(true)

func _on_button_mouse_exited() -> void:
	if locked == false:
		in_focus(false)
