extends Node2D

var player

func start(player_ref):
	player = player_ref
	update_stats()

func update_stats(selected_ones={"coin":0,"mana":0,"heart":0}):
	for stat in ["coin","mana","heart"]:
		player[3].stats[stat][0]#current
		player[3].stats[stat][1]#max
		if get_node(stat).get_children().size() < player[3].stats[stat][1]:
			var diffrence = player[3].stats[stat][1] - get_node(stat).get_children().size()
			for d in diffrence:
				var newer = load("res://NC/UIParts/chain_icon.tscn").instantiate()
				get_node(stat).add_child(newer)
				newer.start(stat,"empty")
				newer.position.x = (-11*(get_node(stat).get_child_count()-1))
		var current_after_selected = player[3].stats[stat][0] - selected_ones[stat]
		for c in get_node(stat).get_children().size():
			if c < current_after_selected:
				get_node(stat).get_children()[c].update_graphic("default")
			elif c < player[3].stats[stat][0]:
				get_node(stat).get_children()[c].update_graphic("selected")
			else:
				get_node(stat).get_children()[c].update_graphic("empty")
