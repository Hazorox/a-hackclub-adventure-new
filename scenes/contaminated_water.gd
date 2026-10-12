extends Area2D

var speed : int

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -10)
	position += Vector2(random_x, random_y)
	speed = 200

func _process(delta: float) -> void:
	position += Vector2(0, 1.0) * speed * delta
	@warning_ignore("narrowing_conversion")
	speed += 10 * delta

func _on_area_entered(area: Area2D) -> void:
	if area.is_in_group("waterbucket"):
		queue_free()
