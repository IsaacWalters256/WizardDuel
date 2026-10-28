extends Node2D


func start():#currently not triggering
	pass#makes the starting units
	#get_parent().holding_hand.get_node("InventorySpot0/Child")#.get_children
	#create_unit("Swordsman")


func create_unit(type):
	var new_unit = load("res://NC/Basic/unit.tscn").instantiate()
	var u_sprite = load(unit_types[type]).instantiate()
	new_unit.start(u_sprite,get_parent().pauser)
	return new_unit


#check, are there any player units in this room? We don't need to run combat if not
#checks if there is an enemy in this square
	#if so, do I have melee moves?
		#if not, move
		#if yes, % a melee move to use (if awares, checks if they are using a move and such)
			#should i block?
			#can i use regain stamina?
	#if not, are there enemies on screen?
		#if so, do i have a ranged move?
			#if so, move to a ranged space (space that is same row) (checks move % chance)
			#if not, move towards the enemy





#i guess we don't need a function to make a unit, just need to deep copy from here
var unit_types = {
	"Swordsman": "res://NC/Units/swordsman.tscn",
}



#heart 0, spade 1, diamond 2, club 3
var room_groups = [
	[
		[],#jokers are treasure chests that need to be placed
		[["unit name","location MidMid"]],
		
	]
]
