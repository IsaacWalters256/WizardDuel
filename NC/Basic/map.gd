extends Node2D

func start():
	pass

func new_action(type):
	pass#type could be new day which folds it out and places new cards
	#end day which calcualtes the cards in a damaging way
	#switch room which lets the player click one of the buttons to move there.




func create_deck():#for refrence
	var deck = []
	for suit in 4:#0,1,2,3
		deck.append([suit*15,(suit*15)+1,[suit,0]])
		for number in 13:
			deck.append([(suit*15)+2+number,(suit*15)+1,[suit,number+1]])
	deck.shuffle()
	#card_order = deck


#this stuff wont be part of the rotation
#func enter_card(which):
	#map.is_in_room = true
	#map.visible = false
	#get_node("CardCover").frame = which.card_info[0]
	#get_node("CardCover").position = which.get_global_position()
	#get_node("CardCover").scale = Vector2(1,1)
	#get_node("CardCover").rotation = 0
	#get_node("CardCover").modulate = Color(1,1,1,1)
	#room_replace_position = [which.room,which.room.position]
	#var room_trans = pauser.get_tween(self,3)
	#room_trans.tween_property(get_node("CardCover"), "position", get_node("RoomPostionRef").position, 1.0)
	#room_trans.parallel().tween_property(get_node("CardCover"), "scale", Vector2(3,3), 1.0)
	#room_trans.parallel().tween_property(get_node("CardCover"), "rotation", deg_to_rad(90), 1.0)
	##room_trans.tween_property(which.room, "position", get_node("RoomPostionRef").position, 0.1)
	#room_trans.tween_callback(which.room.squish)
	#room_trans.tween_property(get_node("CardCover"), "scale", Vector2(1.5,3), 1.0)
	#room_trans.tween_property(get_node("CardCover"), "modulate", Color(1,1,1,0), 0.5)
	#room_trans.tween_callback(which.room.ready)
