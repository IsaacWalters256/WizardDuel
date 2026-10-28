extends Sprite2D

func new_starting_group():
	get_node("InventorySpot0").add_holding(true,get_parent().unit_maker.create_unit("Swordsman"))
	
