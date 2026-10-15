extends Node2D


func start(number_of_players):
	var new_players = []
	for p in number_of_players:
		if new_players.size() < 1:
			new_players.append([p-1,"wizard",null,null,["player","keyboard"],null])
		else:
			new_players.append([p-1,"wizard",null,null,["ai","na"],null])
	get_parent().creation_done(new_players)
