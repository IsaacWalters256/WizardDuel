extends Node2D

var speed = 4

var owner_id
var players
var anis = {
	"idle": [
		{"an":0},
		{"an":1},
		{"an":2},
		{"an":3},
		{"an":4},
		{"an":5,"loop":true}
	],#the frames it plays
	"move": [
		{"an":15,"move":speed},
		{"an":16,"move":speed},
		{"an":17,"move":speed},
		{"an":18,"move":speed},
		{"an":19,"move":speed},
		{"an":20,"move":speed},
		{"an":21,"move":speed},
		{"an":22,"move":speed,"loop":true}
	],
	#"turn_around": [
	#	{"an":15,"direction_change":true},
	#]
}

func start(owner_id_ref,players_ref):
	owner_id = owner_id_ref
	players = players_ref
	players_ref[owner_id][3] = get_parent()
