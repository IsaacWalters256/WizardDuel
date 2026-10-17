extends Node2D


func start():
	get_node("AniTickTimer").start()

func next_ani_frame(c):
	#print("___")
	#print(typing.anis[current_ani].size())
	#print(current_frame)
	if c.anis_info[1] < c.anis[c.anis_info[0]].size()-1:
		c.anis_info[1] = c.anis_info[1] + 1
		if c.anis[c.anis_info[0]][c.anis_info[1]].has("an"):
			c.graphic.frame = c.anis[c.anis_info[0]][c.anis_info[1]]["an"]
		if c.anis[c.anis_info[0]][c.anis_info[1]].has("loop"):
			c.new_ani(c.anis_info[0])
		if c.anis[c.anis_info[0]][c.anis_info[1]].has("direciton_change"):
			c.swap_direction()
		if c.anis[c.anis_info[0]][c.anis_info[1]].has("move"):
			#check if something is in the way
			if c.direction_facing == "right":
				c.position.x = c.position.x + c.anis[c.anis_info[0]][c.anis_info[1]]["move"]
			elif c.direction_facing == "left":
				c.position.x = c.position.x - c.anis[c.anis_info[0]][c.anis_info[1]]["move"]
			elif c.direction_facing == "up":
				print("dsd")
				c.update_z(c.z_value-2)
			elif c.direction_facing == "down":
				c.update_z(c.z_value+2)

func _on_ani_tick_timer_timeout() -> void:
	for u in get_parent().get_node("Units").get_children():
		next_ani_frame(u)
