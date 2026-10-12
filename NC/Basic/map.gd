extends Node2D

var tile_line = []


func start():
	for p in get_parent().players:
		new_tile("none")
		new_tile("none")
		new_tile("none")
		new_unit(p[1],p[0],30)


func new_unit(type,u_owner,posx):
	var new_unit = load("res://NC/Basic/unit_base.tscn").instantiate()
	get_node("Units").add_child(new_unit)
	var typing = load(unit_dict[type]).instantiate()
	new_unit.typing = typing
	new_unit.add_child(typing)
	new_unit.position.x = posx
	new_unit.start(u_owner,get_parent().players)

func new_tile(type):
	var new_tile = load("res://NC/Basic/tile_base.tscn").instantiate()
	get_node("Tiles").add_child(new_tile)
	tile_line.append(new_tile)
	new_tile.position.x = tile_line.size()*128




var unit_dict = {
	"wizard": "res://NC/Units/wizard.tscn"
}
