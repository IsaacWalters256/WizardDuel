extends Node2D

@export var top_card_id = "Card0"
@export var bottom_card_id = "Card4"
var health = self
@onready var main = get_parent().get_parent().get_parent()

func start(health_ref):
	health = health_ref

func score_double():
	#print(two_cards[0].card_info)#2, 1-15, 0 is joker
	var moving_tween = main.pauser.get_tween(self)
	var top_card = get_parent().get_parent().cards[top_card_id]
	var bottom_card = get_parent().get_parent().cards[bottom_card_id]
	var label = get_node("Number Label")
	
	var amount = 0
	if bottom_card.card_info[2][1] != top_card.card_info[2][1]:
		if bottom_card.card_info[2][1] < 13:
			if bottom_card.card_info[2][1] > 10:
				amount = amount + 10
			else:
				amount = amount + bottom_card.card_info[2][1]
			if bottom_card.card_info[2][1] == 0:
				amount = amount - 5
		if top_card.card_info[2][1] < 15:
			if top_card.card_info[2][1] > 10:
				amount = amount + 10
			else:
				amount = amount + top_card.card_info[2][1]
			if top_card.card_info[2][1] == 0:
				amount = amount - 5
	label.text = str(amount)
	
	moving_tween.tween_property(top_card, "position", Vector2(top_card.position.x,44), 0.5)
	moving_tween.parallel().tween_property(bottom_card, "position", Vector2(top_card.position.x,-44), 0.5)
	moving_tween.tween_property(self, "modulate", Color(1,1,1,1), 0.1)
	moving_tween.parallel().tween_property(top_card, "modulate", Color(1,1,1,0), 0.5)
	moving_tween.parallel().tween_property(bottom_card, "modulate", Color(1,1,1,0), 0.5)
	moving_tween.tween_property(self, "z_index", 5, 0.1)
	moving_tween.tween_property(label, "position", Vector2(health.position.x-self.position.x,label.position.y), 0.5)
	moving_tween.tween_callback(health.change_hp.bind(health.get_node("OrbEnergy").value-amount,0.5))
	moving_tween.tween_property(self, "modulate", Color(1,1,1,0), 0.1)
	moving_tween.tween_property(label, "position", Vector2(-13,label.position.y), 0.1)
	moving_tween.tween_property(self, "z_index", 0, 0.1)
