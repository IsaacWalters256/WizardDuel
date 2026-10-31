extends Node2D

@onready var pauser = get_parent().get_node("Pauser")

@onready var health = get_node("Health")
@onready var clock = get_node("Clock")
@onready var unit_maker = get_node("UnitMaker")
@onready var holding_hand = get_node("HoldingHand")
@onready var map = get_node("Map")
@onready var bag = get_node("Bag")
@onready var moving_hand = get_node("MovingHand")
@onready var current_rooms = get_node("CurrentRooms")
@onready var mouse_hit = get_node("MouseHit")
@onready var map_summon = get_node("SummonMap")
var hour = 0
var day = 0 #have this instead of difficulty?

#pass in how many days they want the week to be 
func start():
	health.start(self)
	clock.start(self)
	unit_maker.start(self,pauser)
	holding_hand.start(self,pauser)
	map.start(self,pauser)
	bag.start(self,pauser)
	moving_hand.start(self,pauser)
	current_rooms.start(self,pauser)
	mouse_hit.start(self,pauser)
	
	next_stage("start_week")


func next_stage(which):
	if which == "start_week":#new game basically
		health.reset_health()
		holding_hand.new_starting_group()
		next_stage("prepare_start_day")
	elif which == "prepare_start_day":
		clock.reset_time()
	elif which == "start_day":
		clock.time()
		map.new_day()
		hour = 0
	elif which == "next_hour":
		pass#shuffle_deck()
		hour = hour + 1
	elif which == "end_day_lockout":
		pass
	elif which == "end_day":
		pass
	elif which == "end_week":
		pass
	#boss fight?



#func shuffle_deck():
	#deck.reshuffle("all")


#func new_round_or_new_game():
	#if health.hp.value > 0:
		#start_new_round()
	#else:
		#lost_game()

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



func exit_room():
	map.is_in_room = false
	map.visible = true
	#room_replace_position[0].position = room_replace_position[1]
	#for c in get_node("CurrentMap").cards:
	#	if !get_node("CurrentMap").cards[c].face_down:#doesnt account for damage currently being delt
			
