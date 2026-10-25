extends Node2D

@onready var pauser = get_parent().get_node("Pauser")
@onready var mouser = get_parent().get_node("MouseFollow")

@onready var map = get_node("CurrentMap")
@onready var deck = get_node("MapDeck")
@onready var health = get_node("Health")
@onready var clock = get_node("Clock")
#var input_locked = true

func start():
	mouser.start()
	start_new_game()
#TODO instead of starting it like this, start it with the book and they press a new game button or a save button or something and the book moves down to its spot and everything initializes and the deck spits out its cards

func reset_game():
	start_new_game()

func start_new_game():#mess with passing save data here eventually
	clock.start()
	deck.create_deck()
	health.reset_health()
	map.start(deck)
	start_new_round()

func start_new_round(shuffle_finished = false):
	if !shuffle_finished:
		deck.reshuffle("all")
	else:
		map.reset_board()
		clock.reset_time()
	

func new_round_or_new_game():
	if health.hp.value > 0:
		start_new_round()
	else:
		lost_game()

func game_board_ready():
	clock.time(true)
	#input_locked = false

func round_end():
	map.deal_damage()
	var ending_tween = pauser.get_tween(self)
	
	ending_tween.tween_callback(map.cards["Hand"].movement.bind(["flip"])).set_delay(1.5)
	ending_tween.tween_property(map.cards["Hand"], "modulate", Color(1,1,1,0), 0.5).set_delay(1.5)



func lost_game():
	reset_game()
	print("lost the game")
