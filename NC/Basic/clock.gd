extends Node2D

var main

func start(main_ref):
	main = main_ref
	get_node("OrbEnergy").max_value = current_max
	get_node("OrbEnergy").value = current_max

var timer
var current_max = 300

func end():
	get_node("OrbEnergy").value = current_max
	timer = get_parent().pauser.get_tween(self)
	timer.kill()

func time():
	get_node("OrbEnergy").value = 0
	get_node("OrbEnergy").max_value = current_max
	var max_section = get_node("OrbEnergy").max_value/5
	timer = get_parent().pauser.get_tween(self)
	timer.tween_property(get_node("OrbEnergy"), "value", max_section, max_section)
	timer.tween_callback(self.time_check.bind(0))
	timer.tween_property(get_node("OrbEnergy"), "value", max_section*2, max_section)
	timer.tween_callback(self.time_check.bind(1))
	timer.tween_property(get_node("OrbEnergy"), "value", max_section*3, max_section)
	timer.tween_callback(self.time_check.bind(2))
	timer.tween_property(get_node("OrbEnergy"), "value", max_section*4, max_section)
	timer.tween_callback(self.time_check.bind(3))
	timer.tween_property(get_node("OrbEnergy"), "value", max_section*5, max_section)
	timer.tween_callback(self.time_check.bind(4))

func reset_time():
	timer = get_parent().pauser.get_tween(self)
	timer.tween_property(get_node("OrbEnergy"), "value", 0, 5).set_trans(Tween.TRANS_QUART)
	timer.tween_callback(main.next_stage.bind("start_day"))


func time_check(which):
	if which < 4:
		get_parent().map.flip_next_card()
	else:
		get_parent().round_end()
