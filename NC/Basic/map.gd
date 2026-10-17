extends Node2D

var tile_line = []
var main = null

func start(main_ref):
	main = main_ref
	for p in main.players:
		new_tile("standard1")
		new_tile("plains1")
		new_tile("plains1")
		new_tile("plains1")
		new_tile("standard1")
		new_unit(p[1],p[0],(480*p[0])+176)
	get_node("AniRunner").start()

func new_unit(type,u_owner,posx):
	var new_unit = load("res://NC/Basic/unit_base.tscn").instantiate()
	get_node("Units").add_child(new_unit)
	var typing = load(unit_dict[type]).instantiate()
	new_unit.typing = typing
	new_unit.add_child(typing)
	new_unit.position.x = posx
	new_unit.start(u_owner,main.players)

func new_tile(type):
	var new_tile = load("res://NC/Basic/tile_base.tscn").instantiate()
	get_node("Tiles").add_child(new_tile)
	tile_line.append(new_tile)
	new_tile.position.x = tile_line.size()*128
	#new_tile.position.y = 24
	var typing = load(tile_dict[type]).instantiate()
	new_tile.typing = typing
	new_tile.add_child(typing)




var unit_dict = {
	"wizard": "res://NC/Units/wizard.tscn"
}
var tile_dict = {
	"plains1": "res://NC/Tiles/plains_1.tscn",
	"standard1": "res://NC/Tiles/standard_1.tscn"
}
