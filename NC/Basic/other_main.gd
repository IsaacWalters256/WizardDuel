extends Node2D

@onready var pauser = get_parent().get_node("Pauser")
var cards = {
	"Card0":null,
	"Card1":null,
	"Card2":null,
	"Card3":null,
	"Card4":null,
	"Card5":null,
	"Hand":null,
}

func start():
	create_deck()
	reset_board()



func create_deck():
	var deck = []
	for suit in 4:#0,1,2,3
		deck.append([suit*15,(suit*15)+1,[suit,0]])
		for number in 13:
			deck.append([(suit*15)+2+number,(suit*15)+1,[suit,number+1]])
	deck.shuffle()
	print(deck)
	get_node("MapDeck").start(deck)

func game_board_ready():
	print("dd")

func reset_board():
	var board_setting_tween = pauser.get_tween(self)
	var card_draw_delay = 0.5
	for i in range(6):
		board_setting_tween.tween_callback(get_node("MapDeck").draw_card.bind(true,get_node("CardSpots"),get_node("CardSpots/Spot"+str(i)))).set_delay(card_draw_delay)
	
	if get_node("CardSpots/HandSpot").get_child_count() < 1:
		board_setting_tween.tween_callback(get_node("MapDeck").draw_card.bind(true,get_node("CardSpots"),get_node("CardSpots/HandSpot"))).set_delay(card_draw_delay)
		
	board_setting_tween.tween_callback(self.flip_starting_cards).set_delay(1)

func flip_starting_cards():
	var board_setting_tween = pauser.get_tween(self)
	if get_node("CardSpots/HandSpot").get_child(0).face_down:
		board_setting_tween.tween_callback(get_node("CardSpots/HandSpot").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	
	board_setting_tween.tween_callback(get_node("CardSpots/Spot0").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	board_setting_tween.tween_callback(get_node("CardSpots/Spot1").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	
	board_setting_tween.tween_callback(self.game_board_ready).set_delay(0.3)
