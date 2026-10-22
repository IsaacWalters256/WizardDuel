extends Node2D

var paused = false
var mega_tween = {
	
}


func get_tween(node_creating,index=0):
	var id = str(node_creating) + str(index)
	if mega_tween.has(id):
		if mega_tween[id]:
			mega_tween[id].kill()
	mega_tween[id] = get_tree().create_tween()
	return mega_tween[id]


func pause_all(is_pausing):
	
	paused = is_pausing
	
	set_pause_subtree(get_parent().get_node("OtherMain"), paused)
	
	if paused:
		for m in mega_tween:
			mega_tween[m].pause()
	else:
		for m in mega_tween:
			mega_tween[m].play()

func set_pause_subtree(root: Node, pause: bool) -> void: #from godot docs forum
	var process_setters = ["set_process", "set_physics_process", "set_process_input", "set_process_unhandled_input", "set_process_unhandled_key_input", "set_process_shortcut_input",]
	for setter in process_setters:
		root.propagate_call(setter, [!pause])
