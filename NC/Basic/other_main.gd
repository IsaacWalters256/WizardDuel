extends Node2D

@onready var pauser = get_parent().get_node("Pauser")

@onready var map = get_node("CurrentMap")
@onready var deck = get_node("MapDeck")
@onready var health = get_node("Health")
@onready var clock = get_node("Clock")
@onready var unit_maker = get_node("UnitMaker")
@onready var holding_hand = get_node("HoldingHand")
#var input_locked = true

var room_replace_position = [get_node("Room0"),Vector2(0,0)]

var difficulty = 0

func start():
	get_node("MouseHit").start()
	ucp("start_game")
#TODO instead of starting it like this, start it with the book and they press a new game button or a save button or something and the book moves down to its spot and everything initializes and the deck spits out its cards

func ucp(which):#unified command pump
	if which == "start_game":
		reset_all()
		start_new_game()
	elif which == "new_round":
		start_new_round()
	elif which == "shuffle_deck":
		shuffle_deck()
	elif which == "start_new_round":
		start_new_round()



func reset_all():
	pauser.end()
	clock.end()
	deck.end()
	map.end()

func start_new_game():#mess with passing save data here eventually
	clock.start()
	deck.create_deck()
	health.reset_health()
	map.start(deck)
	holding_hand.new_starting_group()
	
	ucp("shuffle_deck")

func shuffle_deck():
	deck.reshuffle("all")

func start_new_round():
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
	#reset_game()
	print("lost the game")

func enter_card(which):
	map.is_in_room = true
	map.visible = false
	get_node("CardCover").frame = which.card_info[0]
	get_node("CardCover").position = which.get_global_position()
	get_node("CardCover").scale = Vector2(1,1)
	get_node("CardCover").rotation = 0
	get_node("CardCover").modulate = Color(1,1,1,1)
	room_replace_position = [which.room,which.room.position]
	var room_trans = pauser.get_tween(self,3)
	room_trans.tween_property(get_node("CardCover"), "position", get_node("RoomPostionRef").position, 1.0)
	room_trans.parallel().tween_property(get_node("CardCover"), "scale", Vector2(3,3), 1.0)
	room_trans.parallel().tween_property(get_node("CardCover"), "rotation", deg_to_rad(90), 1.0)
	#room_trans.tween_property(which.room, "position", get_node("RoomPostionRef").position, 0.1)
	room_trans.tween_callback(which.room.squish)
	room_trans.tween_property(get_node("CardCover"), "scale", Vector2(1.5,3), 1.0)
	room_trans.tween_property(get_node("CardCover"), "modulate", Color(1,1,1,0), 0.5)
	room_trans.tween_callback(which.room.ready)
	#TODO moving room with this tween is messing some stuff up

func exit_room():
	map.is_in_room = false
	map.visible = true
	room_replace_position[0].position = room_replace_position[1]
	#for c in get_node("CurrentMap").cards:
	#	if !get_node("CurrentMap").cards[c].face_down:#doesnt account for damage currently being delt
			
