extends TextureButton

var w = true
var act := &"right"
var event: InputEventKey

func _on_pressed() -> void:
	InputMap.action_erase_events(act)
	event = InputEventKey.new()
	if w:
		w = false
		event.keycode = KEY_RIGHT
		InputMap.action_add_event(act, event)
		texture_normal = preload("res://assets/icons/SimpleKeys/SimpleKeys/Jumbo/Dark/Single PNGs/ARROWRIGHT.png")
	else:
		w = true
		event.keycode = KEY_D
		InputMap.action_add_event(act, event)
		texture_normal = preload("res://assets/icons/SimpleKeys/SimpleKeys/Jumbo/Dark/Single PNGs/D.png")
