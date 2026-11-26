extends TileMapLayer

var game_over_scene : PackedScene = preload("res://scenes/ui/river_runner.tscn")
var layer : CanvasLayer = null
var finished := false

@export var speed: float = 300.0

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	position.y += speed * delta
	if global_position.y > 750:
		queue_free()
	var overlapping_bodies = $Area2D.get_overlapping_bodies()
	for body in overlapping_bodies:
		if body.is_in_group("player"):
			SceneManager.return_to_cached()
			
