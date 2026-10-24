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
	get_node("Clock").start()
	create_deck()
	reset_board()
#TODO instead of starting it like this, start it with the book and they press a new game button or a save button or something and the book moves down to its spot and everything initializes and the deck spits out its cards

func game_board_ready():
	get_node("Clock").time(true)



func create_deck():
	var deck = []
	for suit in 4:#0,1,2,3
		deck.append([suit*15,(suit*15)+1,[suit,0]])
		for number in 13:
			deck.append([(suit*15)+2+number,(suit*15)+1,[suit,number+1]])
	deck.shuffle()
	print(deck)
	get_node("MapDeck").start(deck)




func reset_board():
	var board_setting_tween = pauser.get_tween(self)
	var card_draw_delay = 0.5
	for i in range(6):
		board_setting_tween.tween_callback(get_node("MapDeck").draw_card.bind(true,get_node("CardSpots"),get_node("CardSpots/Spot"+str(i)),"Card"+str(i))).set_delay(card_draw_delay)
	
	if get_node("CardSpots/HandSpot").get_child_count() < 1:
		board_setting_tween.tween_callback(get_node("MapDeck").draw_card.bind(true,get_node("CardSpots"),get_node("CardSpots/HandSpot"),"Hand")).set_delay(card_draw_delay)
		
	board_setting_tween.tween_callback(self.flip_starting_cards).set_delay(1)

func flip_next_card():
	if cards["Card2"].face_down:
		cards["Card2"].movement(["flip"])
	elif cards["Card3"].face_down:
		cards["Card3"].movement(["flip"])
	elif cards["Card4"].face_down:
		cards["Card4"].movement(["flip"])
	elif cards["Card5"].face_down:
		cards["Card5"].movement(["flip"])

func round_end():
	print("over")
	var ending_tween = pauser.get_tween(self)
	ending_tween.tween_callback(score_double.bind(["Card0,Card3"])).set_delay(0.1)
	ending_tween.tween_callback(score_double.bind(["Card0,Card3"])).set_delay(1)
	ending_tween.tween_callback(score_double.bind(["Card0,Card3"])).set_delay(1)
	#ending_tween.tween_callback(score_double.bind(["Card0,Card3"])).set_delay(0.1)
	#flip the left two cards, tween a number label to the blood thing,increase it
	#mid two
	#right two
	#flip hand over, move all cards into the deck

func score_double(two_cards):
	pass
	#checks the two cards
	#tweens a label to go to the health node
	#tween health node callback lose health (lowers it over time in this tween)
	#health node will then check for a lose

func flip_starting_cards():
	var board_setting_tween = pauser.get_tween(self)
	if get_node("CardSpots/HandSpot").get_child(0).face_down:
		board_setting_tween.tween_callback(get_node("CardSpots/HandSpot").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	
	board_setting_tween.tween_callback(get_node("CardSpots/Spot0").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	board_setting_tween.tween_callback(get_node("CardSpots/Spot1").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	
	board_setting_tween.tween_callback(self.game_board_ready).set_delay(0.3)
