extends Node2D

var actions = [
	
]

var typing
var owner_id = -1

func start(tile_to_load,owner_id_ref):
	var ttl = load(tile_to_load).instantiate()
	self.add_child(ttl)
	typing = ttl
	typing.start()
	owner_id = owner_id_ref
