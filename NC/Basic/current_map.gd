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
var deck

func start(deck_ref):
	deck = deck_ref
	for g in get_node("CardDamagers").get_children():
		g.start(get_parent().get_node("Health"))

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
	board_setting_tween.tween_callback(get_node("HandSpot").get_child(0).movement.bind(["flip"])).set_delay(0.5)
	board_setting_tween.tween_callback(self.flip_next_card).set_delay(0.5)
	board_setting_tween.tween_callback(self.flip_next_card).set_delay(0.5)
	
	board_setting_tween.tween_callback(get_parent().game_board_ready).set_delay(0.3)

func flip_next_card():
	if cards["Card0"].face_down:
		cards["Card0"].movement(["flip"])
		cards["Card0"].lock_card(false)
	elif cards["Card1"].face_down:
		cards["Card1"].movement(["flip"])
		cards["Card1"].lock_card(false)
	elif cards["Card2"].face_down:
		cards["Card2"].movement(["flip"])
		cards["Card2"].lock_card(false)
	elif cards["Card3"].face_down:
		cards["Card3"].movement(["flip"])
		cards["Card3"].lock_card(false)
	elif cards["Card4"].face_down:
		cards["Card4"].movement(["flip"])
		cards["Card4"].lock_card(false)
	elif cards["Card5"].face_down:
		cards["Card5"].movement(["flip"])
		cards["Card5"].lock_card(false)

func deal_damage():
	var ending_tween = get_parent().pauser.get_tween(self)
	
	for c in cards:
		cards[c].lock_card(true)
	
	ending_tween.tween_callback(get_node("CardDamagers/Left").score_double).set_delay(0.1)
	ending_tween.tween_callback(get_node("CardDamagers/Mid").score_double).set_delay(2.5)
	ending_tween.tween_callback(get_node("CardDamagers/Right").score_double).set_delay(2.5)
	ending_tween.tween_callback(get_parent().new_round_or_new_game).set_delay(2.5)
