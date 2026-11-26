extends CanvasLayer





func _on_exit_button_pressed() -> void:
	get_tree().current_scene.queue_free()
