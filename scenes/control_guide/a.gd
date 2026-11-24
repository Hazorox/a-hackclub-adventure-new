extends TextureButton

var w = true
var act := &"left"
var event: InputEventKey

func _on_pressed() -> void:
	InputMap.action_erase_events(act)
	event = InputEventKey.new()
	if w:
		w = false
		event.keycode = KEY_LEFT
		InputMap.action_add_event(act, event)
		texture_normal = preload("res://assets/icons/SimpleKeys/SimpleKeys/Jumbo/Dark/Single PNGs/ARROWLEFT.png")
	else:
		w = true
		event.keycode = KEY_A
		InputMap.action_add_event(act, event)
		texture_normal = preload("res://assets/icons/SimpleKeys/SimpleKeys/Jumbo/Dark/Single PNGs/A.png")
