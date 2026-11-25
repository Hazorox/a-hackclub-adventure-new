extends Node

var cached_scene: Node = null

signal shower_taken(finished)

func go_to_scene(scene):
	cached_scene = get_tree().current_scene
	get_tree().root.remove_child(cached_scene)
	var new_scene = load(scene).instantiate()
	get_tree().root.add_child(new_scene)
	get_tree().current_scene = new_scene

func return_to_cached():
	get_tree().root.remove_child(get_tree().current_scene)
	get_tree().root.add_child(cached_scene)
	get_tree().current_scene = cached_scene
	cached_scene.set_process(true)
	cached_scene.set_physics_process(true)
	shower_taken.emit(cached_scene)
