extends Node2D

var left_to_right = ["Lef","LTh","Mid","RTh","Rig"]
var up_to_down = ["Top","Mid","Bot"]
var what_is = "hot_spot"

var hot_spots_to_activate = {
	"0": ["MidMid"],
	"1": ["MidMid"],
	"2":["LefMid","RigMid"],
	"3":["LefMid","MidMid","RigMid"],
	"4":["LefTop","LefBot","RigTop","RigBot"],
	"5":["LefTop","LefBot","MidMid","RigTop","RigBot"],
	"6":["LefTop","LefBot","MidTop","MidBot","RigTop","RigBot"],
	"7":["LefMid","LThTop","LThBot","MidMid","RThTop","RThBot","RigMid"],
	"8":["LefTop","LefBot","LThTop","LThBot","RThTop","RThBot","RigTop","RigBot"],
	"9":["LefTop","LefBot","LThTop","LThBot","MidMid","RThTop","RThBot","RigTop","RigBot"],
	"10":["LefTop","LefBot","LThMid","LThTop","LThBot","RThTop","RThBot","RThMid","RigTop","RigBot"],
	"11":["LefMid","LefBot","LThMid","LThTop","LThBot","MidTop","MidMid","MidBot","RThTop","RThMid","RThBot","RigMid","RigTop"],
	"12":["LefBot","LefMid","LThMid","MidMid","RThMid","RigTop","RigMid"],
	"13":["LefBot","LefMid","LThMid","LThBot","MidMid","RThTop","RThMid","RigTop","RigMid"],
}

#movement will be looking at the node name you're on, splitting characters three and three, and if you are mid mid, for left right you look at the first one and its mid so the closest are lth or rth, check the mids on those and if turned on thats where we can move if not it checks lef and rig

func load_new(type):
	for c in get_children():
		c.locked = true
		c.visible = false
		c.battle_spot.locked = true
	for c in hot_spots_to_activate[str(type)]:
		get_node(c).locked = false
		get_node(c).visible = true
		get_node(c).battle_spot.locked = false
