extends Node2D



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
	"Swordsman": {
		"Is_Player": true,
		
		"frame_info": {
			"current": 0,
			"h_amount":0,
			"v_amount": 0
		},
		
		"Steady": 0,
		"Stamina": 0,
		"Awares": 0,
		"Modesty": 0,
		"Strength": 0,
		"Superstition": 0,
		
		"Kills":0,
		"Awards": 0,
		
		"Moves": {
			
		}
	},
}



#heart 0, spade 1, diamond 2, club 3
var room_groups = [
	[
		[],#we dont do the jokers
		[["unit name","location MidMid"]],
		
	]
]
