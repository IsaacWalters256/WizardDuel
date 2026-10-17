extends Node2D



func start():
	pass#set_up_controls(6)

#func _unhandled_input(event: InputEvent) -> void:
	#if event is InputEventKey:
		#if event.pressed and event.keycode == KEY_ESCAPE:
			#get_tree().quit()
	#for p in get_parent().players:
		#if p[5]:
			#p[5].passed_input(event)
	#Input.is_action_just_pressed("left")

func set_up_controls(playerCount:int):
	var actionList:Array[StringName]
	var actionEventList:Array[InputEvent]
	var currentAction:StringName
	var currentEvent:InputEvent
	actionList = InputMap.get_actions()
	
	for player in range(playerCount):
		for act in range(actionList.size()):
			if(actionList[act].begins_with("ui_")):
				continue
			else:
				currentAction = actionList[act]+str(player)
				InputMap.add_action(currentAction)
				actionEventList = InputMap.action_get_events(actionList[act])
				for event in range(actionEventList.size()):
					currentEvent = actionEventList[event].duplicate(true)
					currentEvent.set_device(player)
					print(currentEvent.device)
					InputMap.action_add_event(currentAction,currentEvent)
#https://www.reddit.com/r/godot/comments/13ikz4u/best_way_to_handle_controller_input_for_local/
