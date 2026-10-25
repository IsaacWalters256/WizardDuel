extends Node2D

var current_hp = 0
@onready var hp = get_node("OrbEnergy")

func reset_health():
	change_hp(72,5)
	#hp_tween.parallel().tween_property(current_hp, "value", 72, 5)



func change_hp(new_amount,time):
	var hp_tween = get_parent().pauser.get_tween(self)
	hp_tween.tween_property(get_node("OrbEnergy"), "value", new_amount, time).set_trans(Tween.TRANS_QUART)

func _process(delta: float) -> void:
	get_node("Number Label").text = str(int(get_node("OrbEnergy").value))
