extends Node2D

var cards = {
	"Card0":null,
	"Card1":null,
	"Card2":null,
	"Card3":null,
	"Card4":null,
	"Card5":null,
	"Hand":null,
}
var rooms = {
	"Card0":null,
	"Card1":null,
	"Card2":null,
	"Card3":null,
	"Card4":null,
	"Card5":null,
	"Hand":null,
}
var deck
var is_in_room = false

func end():
	remove_cards()

func start(deck_ref):
	deck = deck_ref
	for g in get_node("CardDamagers").get_children():
		g.start(get_parent().get_node("Health"))
	rooms["Card0"] = get_parent().get_node("Room0")
	rooms["Card1"] = get_parent().get_node("Room1")
	rooms["Card2"] = get_parent().get_node("Room2")
	rooms["Card3"] = get_parent().get_node("Room3")
	rooms["Card4"] = get_parent().get_node("Room4")
	rooms["Card5"] = get_parent().get_node("Room5")
	rooms["Hand"] = get_parent().get_node("Room6")

func remove_cards():
	for c in cards:#gaining back your guys is here, checks rooms for stuff
		if cards[c]:
			cards[c].queue_free()
		cards[c] = null

func reset_board():
	remove_cards()
	
	var board_setting_tween = get_parent().pauser.get_tween(self)
	var card_draw_delay = 0.5
	for i in range(6):
		board_setting_tween.tween_callback(deck.draw_card.bind(true,self,self.get_node("Spot"+str(i)),"Card"+str(i))).set_delay(card_draw_delay)
	
	#if get_node("CardSpots/HandSpot").get_child_count() < 1:
	board_setting_tween.tween_callback(deck.draw_card.bind(true,self,self.get_node("HandSpot"),"Hand")).set_delay(card_draw_delay)
	
	board_setting_tween.tween_callback(self.flip_starting_cards).set_delay(1)
	#if get_node("CardSpots/HandSpot").get_child(0).face_down:

func flip_starting_cards():#needed or else tween breaks
	var board_setting_tween = get_parent().pauser.get_tween(self)
	board_setting_tween.tween_callback(self.flip_hand).set_delay(0.5)
	board_setting_tween.tween_callback(self.flip_next_card).set_delay(0.5)
	board_setting_tween.tween_callback(self.flip_next_card).set_delay(0.5)
	
	board_setting_tween.tween_callback(get_parent().game_board_ready).set_delay(0.3)

func flip_hand():
	cards["Hand"].movement(["flip"])
	rooms["Hand"].connect_card(cards["Hand"])

func flip_next_card():
	var flipped_a_card = false
	for c in cards:
		if flipped_a_card == false:
			if cards[c].face_down:
				cards[c].movement(["flip"])
				rooms[c].connect_card(cards[c])
				flipped_a_card = true

func deal_damage():
	var ending_tween = get_parent().pauser.get_tween(self)
	
	for c in cards:
		cards[c].lock_card(true)
	
	ending_tween.tween_callback(get_node("CardDamagers/Left").score_double).set_delay(0.1)
	ending_tween.tween_callback(get_node("CardDamagers/Mid").score_double).set_delay(2.5)
	ending_tween.tween_callback(get_node("CardDamagers/Right").score_double).set_delay(2.5)
	ending_tween.tween_callback(get_parent().new_round_or_new_game).set_delay(2.5)
