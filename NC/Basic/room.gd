extends Node2D

var selected_focus_enemy = null #player can click an enemy with dagger icon to have allies focus them
var units_here = []
var what_is = "room_edge"

var card = null

func connect_card(card_ref):
	card = card_ref
	card_ref.connect_room(self)
	new_room(card.card_info,get_parent().difficulty)

func new_room(card_info,difficulty):
	print(card_info)#[10, 1, [0, 9]]
	print(difficulty)
	get_node("HotSpots").load_new(card_info[2][1])

func ready():
	pass#unlocks needed hot spots, or really, unlocks this node so the cursor knows that the unlocked hot spots are good

func squish():
	self.position = get_parent().get_node("RoomPostionRef").position
	pass
	#put everyting in the bad position
	#tween to scale down to normal


func _on_timer_timeout() -> void:
	pass#get units next moves
