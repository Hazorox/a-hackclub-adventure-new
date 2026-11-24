extends Node2D

@onready var bar: TextureProgressBar = $Bar

func _process(delta: float) -> void:
	if Globals.is_player_showering == true:
		bar.value = 0

func _on_timer_timeout() -> void:
	bar.value +=2
