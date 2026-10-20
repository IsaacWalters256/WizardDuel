extends Node2D


func start():
	get_node("AniTickTimer").start()

func next_ani_frame(c):
	#print("___")
	#print(typing.anis[current_ani].size())
	#print(current_frame)
	if c.anis.has(c.anis_info[0]):
		if c.anis_info[1] < c.anis[c.anis_info[0]].size()-1:
			c.anis_info[1] = c.anis_info[1] + 1
			if c.anis[c.anis_info[0]][c.anis_info[1]].has("an"):
				c.change_graphic(c.anis[c.anis_info[0]][c.anis_info[1]]["an"])
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
					c.update_z(c.z_value-2)
				elif c.direction_facing == "down":
					c.update_z(c.z_value+2)
			if c.anis[c.anis_info[0]][c.anis_info[1]].has("mod"):
				c.graphic.modulate = c.anis[c.anis_info[0]][c.anis_info[1]]["mod"]
			if c.anis[c.anis_info[0]][c.anis_info[1]].has("custom"):
				c.custom_ani(c.anis[c.anis_info[0]][c.anis_info[1]]["custom"])

func _on_ani_tick_timer_timeout() -> void:
	for u in get_parent().get_node("Units").get_children():
		next_ani_frame(u)
	for s in get_parent().get_node("Tiles").get_children():
		s.next_ani_frame()
	for p in get_parent().get_parent().get_parent().players:
		next_ani_frame(p[6])
