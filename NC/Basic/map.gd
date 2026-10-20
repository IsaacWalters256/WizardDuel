extends Node2D

var tiles = []
var main = null
var current_unit_id = 0

#need a nested array of tiles
#for workers moving they see if its in the 3x3 and then check if it's two tiles away neighbor based
#bring back tile neighbor openings


func start(main_ref):
	var tiles_x_wise = 40
	main = main_ref
	for r in 3:
		tiles.append([])
		for c in tiles_x_wise:
			tiles[r].append(new_tile([-1],"plains1",[r,c]))
	
	for p in main.players:
		var tile_per = round(tiles_x_wise/main.players.size())
		new_unit(p,p[1],tiles[1][tile_per*(p[0]+1)].position)#128
	
	get_node("AniRunner").start()

func new_unit(player,type,pos):
	var new_unit = load("res://NC/Basic/unit_base.tscn").instantiate()
	get_node("Units").add_child(new_unit)
	new_unit.start(player,type,pos,str(current_unit_id))
	
	current_unit_id = current_unit_id + 1

func new_tile(player,type,pos):
	var new_tile = load("res://NC/Basic/tile_base.tscn").instantiate()
	get_node("Tiles").add_child(new_tile)
	new_tile.start(player,type,pos)
	
	return new_tile
	




var unit_dict = {
	"wizard": "res://NC/Units/wizard.tscn"
}
var tile_dict = {
	"plains1": "res://NC/Tiles/plains_1.tscn",
	"Work Hovel": "res://NC/Tiles/work_hovel.tscn",
	"Gold Mine": "res://NC/Tiles/gold_mine.tscn",
	"Training Grounds": "res://NC/Tiles/training_grounds.tscn",
	"Orc Pit": "res://NC/Tiles/orc_pit.tscn",
	"Graveyard": "res://NC/Tiles/graveyard.tscn",
	"Stables": "res://NC/Tiles/stables.tscn",
	"Eternal Flame": "res://NC/Tiles/eternal_flame.tscn",
	"Golden Calf": "res://NC/Tiles/golden_calf.tscn",
	"Transfusion Table": "res://NC/Tiles/transfusion_table.tscn",
	"Pondering Chamber": "res://NC/Tiles/pondering_chamber.tscn",
	"Alter": "res://NC/Tiles/alter.tscn",
}

#[[false,"Work Hovel","Sends peasants to work nearby structures",{"coin":2,"mana":0,"heart":0}],
		#[false,"Gold Mine","Assign peasants to have them mining gold which you can collect",{"coin":2,"mana":0,"heart":0}],
		#[false,"Training Grounds","Train peasants to become fighters, paying for their equipment",{"coin":2,"mana":0,"heart":0}],
		#[false,"Orc Pit","Generates an orc depending on how much mana you put in every so often",{"coin":0,"mana":6,"heart":0}],
		#[false,"Graveyard","When someone dies they may be burried and raised from death here",{"coin":1,"mana":1,"heart":1}],
		#[false,"Stables","Buy horses or hogs, send fighters here to mount them",{"coin":3,"mana":0,"heart":0}],
		#[false,"Eternal Flame","Upgade units to flame forged",{"coin":4,"mana":4,"heart":0}],
		#[false,"Golden Calf","Make deals with dark beings for powerful allies",{"coin":6,"mana":0,"heart":0}],
		#[false,"Transfusion Table","Spend blood and bodies to create powerful monsters",{"coin":3,"mana":3,"heart":0}],
		#[false,"Pondering Chamber","View the battlefield and rest your mana",{"coin":1,"mana":1,"heart":0}],
		#[false,"Alter","Pay your dues to the clergy, and healing those who take refuge",{"coin":2,"mana":0,"heart":0}],
		#[false,"Gate","Blocks enemies from approaching",{"coin":3,"mana":0,"heart":0}],
		#[false,"Bell","Give general battle instructions",{"coin":2,"mana":0,"heart":0}],
		#[false,"Nothing","Destroy this tile",{"coin":1,"mana":0,"heart":0}],]
