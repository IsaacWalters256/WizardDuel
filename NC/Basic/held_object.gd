extends Node2D


var holding = null
@export var change_to_pos = Vector2(-.1,-.1)

func add_holding(adding,thing=null):
	if adding:
		if thing.get_parent():
			thing.reparent(self)
			#thing.position = Vector2(0,-8)
			if change_to_pos != Vector2(-.1,-.1):
				thing.position = change_to_pos
			thing.held_by.add_holding(false)
		else:
			#thing.position = Vector2(0,-8)
			if change_to_pos != Vector2(-.1,-.1):
				thing.position = change_to_pos
			self.add_child(thing)
		thing.held_by = self
		holding = thing
	else:
		#get_node("Held").remove_child(holding)
		holding = null
