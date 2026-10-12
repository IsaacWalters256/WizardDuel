extends Node2D

var u_owner
var players
var anis = {
	"idle": [0,4]#from 0 to 4 or whatever
}

func start(u_owner_ref,players_ref):
	u_owner = u_owner_ref
	players = players_ref
	players_ref[u_owner][3] = get_parent()
