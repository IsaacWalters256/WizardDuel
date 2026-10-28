extends Node2D
#timer only working with autostart on, idk why, maybe  beaceu starting it beofre adding it as child

var what_is = "unit"
var team = 0
var u_sprite = null
var speed = 4 #affected by haste
var current_ani = [0,"idle"]#current step, current anis
var pauser = null
var tween
var held_by = null

#sprite has an anis, containting all animations
#its a dictonary of animation names like idle
#each on is an array containing a dictonary of commands like change sprite

#movement will be in percentages from ????????

func start(unit_type,pauser_ref):
	self.add_child(unit_type)
	u_sprite = unit_type
	pauser = pauser_ref
	#if alley unit, place their sprite at -10,-10 (enemy at 11,-4
	tween_repeater()
	new_animation("idle")


func new_animation(which):
	current_ani = [0,which]

func tween_repeater():
	tween = pauser.get_tween(self)
	tween.tween_callback(self.run_ani_step).set_delay(0.25)#here would be haste
	tween.tween_callback(self.tween_repeater)

func run_ani_step():
	if u_sprite.anis.has(current_ani[1]):
		if u_sprite.anis[current_ani[1]][current_ani[0]].has("f"):
			u_sprite.frame = u_sprite.anis[current_ani[1]][current_ani[0]]["f"]
		
		#can use tween for movement add it to move us between steps
		
		current_ani[0] = current_ani[0] + 1
		if current_ani[0] == u_sprite.anis[current_ani[1]].size():
			ani_ended()


func ani_ended():
	new_animation(current_ani[1])


func _on_next_action_step_timer_timeout() -> void:
	run_ani_step()
	get_node("NextActionStepTimer").start()#start time based on haste
