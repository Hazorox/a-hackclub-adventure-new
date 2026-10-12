extends Node2D

@onready var bar: TextureProgressBar = $Bar

func _on_timer_timeout() -> void:
	bar.value +=2
