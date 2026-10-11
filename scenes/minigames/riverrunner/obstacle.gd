extends TileMapLayer

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
			pass
