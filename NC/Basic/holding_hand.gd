extends Sprite2D

var what_is = "hand"

func new_starting_group():
	get_node("InventorySpot0").held.add_holding(true,get_parent().unit_maker.create_unit("Swordsman"))
	get_node("InventorySpot0").held.holding.team = 0
