extends Node2D

var typing = null
var u_owner = null

func start(u_owner_ref,players_ref):
	typing.start(u_owner_ref,players_ref)
	u_owner = u_owner_ref
