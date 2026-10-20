extends Node2D


#will use the same animation system the players use

#index, wizard type, camera ref, unit ref, control type,pcr
var player
var pcr
var state = "world"
var locked = false
var first_open = true
@onready var current_page = get_node("Book/Pages/PageStructures")#get_node("Book/Pages/PageContents")
@onready var stats_display = get_node("StatsDisplay")


var anis = {
	"slow_open": [
		{"an":24,"mod":Color(1,1,1,0.2)},
		{"an":25,"mod":Color(1,1,1,0.6)},
		{"an":26,"mod":Color(1,1,1,1)},
		{"an":27},
		{"an":28},
		{"an":29},
		{"an":30,},
		{"an":31,"custom":["unlock"]},
	],
	"fast_open": [
		{"an":25,"mod":Color(1,1,1,0.2)},
		{"an":27,"mod":Color(1,1,1,0.6)},
		{"an":31,"mod":Color(1,1,1,1),"custom":["unlock"]},
	],
	"slow_close": [
		{"an":16},
		{"an":17},
		{"an":18},
		{"an":19},
		{"an":20,},
		{"an":21,},
		{"an":22},
		{"an":23,"mod":Color(1,1,1,0.6)},
		{"an":23,"mod":Color(1,1,1,0.2)},
		{"an":23,"custom":["unlock"],"mod":Color(1,1,1,0)},
	],
	"fast_close": [
		{"an":15,"mod":Color(1,1,1,0.6)},
		{"an":18,"mod":Color(1,1,1,0.2)},
		{"an":20,"mod":Color(1,1,1,0.05)},
		{"an":20,"mod":Color(1,1,1,0),"custom":["unlock"]},
	],
	"next_page": [
		{"an":0,"custom":["lock"]},
		{"an":1},
		{"an":2},
		{"an":3},
		{"an":4},
		{"an":5,"custom":["unlock"]},
		{"an":6},
	],
	"previous_page": [
		{"an":9,"custom":["lock"]},
		{"an":10},
		{"an":11},
		{"an":12},
		{"an":13},
		{"an":14,"custom":["unlock"]},
		{"an":15},
	],
}
var anis_info = ["idle",-1]
var graphic = null

func start(player_ref):
	player = player_ref
	pcr = player[3].typing.get_node("PlayerControlReciever")
	player[6] = self
	graphic = get_node("Book")
	#if real player count is greater than 3, change the positions of things
	get_node("Book").modulate = Color(1,1,1,0)
	get_node("OutlineSmallest").visible = false
	
	get_node("StatsDisplay").start(player)
	for c in get_node("Book/Pages").get_children():
		c.start(player)
	
	

func summon_book(coming_in,fast=false):
	locked = true
	if coming_in:
		current_page.focused(true)
		#get_node("Book").visible = true
		locked = true
		state = "book"
		if first_open == true && fast == false:
			anis_info = ["slow_open",-1]
		else:
			anis_info = ["fast_open",-1]
	else:
		current_page.focused(false)
		#get_node("Book").visible = false
		locked = true
		state = "world"
		if first_open == true && fast == false:
			anis_info = ["slow_close",-1]
		else:
			anis_info = ["fast_close",-1]
		#first_open = false
		

func custom_ani(details):
	if details[0] == "unlock":
		locked = false
	elif details[0] == "lock":
		locked = true

func change_graphic(new_frame):
	get_node("Book/BookClipper/Spellbook").frame = new_frame
	for p in get_node("Book/Pages").get_children():
		p.frame = new_frame




func _process(delta: float) -> void:
	if locked == false:
		if player[4][1] == "keyboard":
			if state == "world":
				if Input.is_action_just_pressed("left"):
					pcr.new_command("left_pressed")
				elif Input.is_action_just_pressed("right"):
					pcr.new_command("right_pressed")
				elif Input.is_action_just_pressed("up"):
					pcr.new_command("up_pressed")
				elif Input.is_action_just_pressed("down"):
					pcr.new_command("down_pressed")
				elif Input.is_action_just_pressed("summon_ui"):
					summon_book(true)
				elif Input.is_action_just_pressed("basic_attack"):
					pass
				if Input.is_action_just_released("left"):
					pcr.new_command("left_released")
				elif Input.is_action_just_released("right"):
					pcr.new_command("right_released")
				elif Input.is_action_just_released("up"):
					pcr.new_command("up_released")
				elif Input.is_action_just_released("down"):
					pcr.new_command("down_released")
				
			elif state == "book":
				if Input.is_action_just_pressed("left"):
					if current_page.previous_page is Sprite2D:
						anis_info = ["previous_page",-1]
						current_page.previous_page.texture = load("res://Art/UISprites/Franuka/BookNewPage.png")
						current_page.texture = load("res://Art/UISprites/Franuka/BookOldPage.png")
						current_page.previous_page.focused(true)
						current_page.focused(false)
						current_page = current_page.previous_page
				elif Input.is_action_just_pressed("right"):
					if current_page.next_page is Sprite2D:
						anis_info = ["next_page",-1]
						current_page.next_page.texture = load("res://Art/UISprites/Franuka/BookNewPage.png")
						current_page.texture = load("res://Art/UISprites/Franuka/BookOldPage.png")
						current_page.next_page.focused(true)
						current_page.focused(false)
						current_page = current_page.next_page
				elif Input.is_action_just_pressed("up"):
					current_page.new_input("up")
				elif Input.is_action_just_pressed("down"):
					current_page.new_input("down")
				elif Input.is_action_just_pressed("summon_ui"):
					summon_book(false)
				elif Input.is_action_just_pressed("basic_attack"):
					current_page.new_input("select")
