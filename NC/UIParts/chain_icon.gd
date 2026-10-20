extends Node2D

var type = "heart"
var image_refs = {
	"heart": {
		"default": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_03_Outline.png",
		"selected": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_03_Selected.png",
		"empty": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_04_Outline.png"
	},
	"mana": {
		"default": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_01_Outline.png",
		"selected": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_01_Selected.png",
		"empty": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_02_Outline.png"
	},
	"coin": {
		"default": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_05_Outline.png",
		"selected": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_05_Selected.png",
		"empty": "res://Art/UISprites/Franuka/1x/Mini icons/Icon_05_Outline_Empty.png"
	},
}

func start(type_ref,value):
	type = type_ref
	update_graphic(value)

func update_graphic(value):
	get_node("Sprite2D").texture = load(image_refs[type][value])
