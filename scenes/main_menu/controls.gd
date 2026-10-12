extends Button


func _ready() -> void:
	pressed.connect(start)


func start():
	get_tree().change_scene_to_file("res://scenes/control_guide/control.tscn")
