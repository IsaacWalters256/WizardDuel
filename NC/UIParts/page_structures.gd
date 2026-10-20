extends Sprite2D

var page_name = "Structures"
var player = null

@export var previous_page = Node2D
@export var next_page = Node2D

var index = 0
var structure_list = [[false,"Work Hovel","Sends peasants to work nearby structures",{"coin":2,"mana":0,"heart":0}],
		[false,"Gold Mine","Assign peasants to have them mining gold which you can collect",{"coin":2,"mana":0,"heart":0}],
		[false,"Training Grounds","Train peasants to become fighters, paying for their equipment",{"coin":2,"mana":0,"heart":0}],
		[false,"Orc Pit","Generates an orc depending on how much mana you put in every so often",{"coin":0,"mana":6,"heart":0}],
		[false,"Graveyard","When someone dies they may be burried and raised from death here",{"coin":1,"mana":1,"heart":1}],
		[false,"Stables","Buy horses or hogs, send fighters here to mount them",{"coin":3,"mana":0,"heart":0}],
		[false,"Eternal Flame","Upgade units to flame forged",{"coin":4,"mana":4,"heart":0}],
		[false,"Golden Calf","Make deals with dark beings for powerful allies",{"coin":6,"mana":0,"heart":0}],
		[false,"Transfusion Table","Spend blood and bodies to create powerful monsters",{"coin":3,"mana":3,"heart":0}],
		[false,"Pondering Chamber","View the battlefield and rest your mana",{"coin":1,"mana":1,"heart":0}],
		[false,"Alter","Pay your dues to the clergy, and healing those who take refuge",{"coin":2,"mana":0,"heart":0}],
		#[false,"Gate","Blocks enemies from approaching",{"coin":3,"mana":0,"heart":0}],
		#[false,"Bell","Give general battle instructions",{"coin":2,"mana":0,"heart":0}],
		[false,"Nothing","Destroy this tile",{"coin":1,"mana":0,"heart":0}],
		]

func start(player_ref):
	player = player_ref
	get_node("RefBook").visible = false
	
	var all_structures = ""
	for s in structure_list:
		all_structures = all_structures + s[1] + "\n"
	get_node("Contents").text = all_structures
	
	update_arrow()

func update_arrow():
	get_node("Arrow").position = get_node("ArrowStart").position
	get_node("Arrow").position.y = get_node("Arrow").position.y + (index * 6)
	

func update_paper():
	get_parent().get_parent().get_parent().get_node("StatsDisplay").update_stats(structure_list[index][3])
	player[6].get_node("InstructionsPaper/Contents").text = structure_list[index][2]

func new_input(type):
	if type == "up":
		if index > 0:
			index = index - 1
			update_paper()
			update_arrow()
	elif type == "down":
		if index < structure_list.size()-1:
			index = index + 1
			update_paper()
			update_arrow()
	elif type == "select":
		if player[3].current_tile:
			if (player[3].stats["coin"][0] >= structure_list[index][3]["coin"]) && (player[3].stats["mana"][0] >= structure_list[index][3]["mana"]) && (player[3].stats["heart"][0] >= structure_list[index][3]["heart"]):
				player[3].stats["coin"][0] = player[3].stats["coin"][0] - structure_list[index][3]["coin"]
				player[3].stats["mana"][0] = player[3].stats["mana"][0] - structure_list[index][3]["mana"]
				player[3].stats["heart"][0] = player[3].stats["heart"][0] - structure_list[index][3]["heart"]
				player[6].summon_book(false,true)
				if structure_list[index][1] == "Nothing":#TODO replace this with a return to nature spell
					player[3].current_tile.change_owner([-1])
					player[3].current_tile.change_typing(player[3].current_tile.og_tile)
				else:
					player[3].current_tile.change_owner(player)
					player[3].current_tile.change_typing(structure_list[index][1])

func focused(yes):
	player[6].get_node("InstructionsPaper").visible = yes
	if yes:
		player[6].get_node("StatsDisplay").update_stats(structure_list[index][3])
		update_paper()
	else:
		player[6].get_node("StatsDisplay").update_stats({"coin":0,"mana":0,"heart":0})
