extends Area2D

@export var min_pos := Vector2(20, 20)
@export var max_pos := Vector2(1260, 700)

@onready var sprite: Sprite2D = $Sprite2D
var _hit_round := false

func _ready() -> void:
	body_entered.connect(_on_overlap_detected)
	await _place_randomly()

func _on_overlap_detected(body: Node2D) -> void:
	if body.is_in_group("player"):
		queue_free()
		Globals.tissue_boxes_owned += 1

func _place_randomly() -> void:
	var found_place := false
	while not found_place:
		_hit_round = false
		global_position = Vector2(
			randf_range(min_pos.x, max_pos.x),
			randf_range(min_pos.y, max_pos.y)
		)
		await get_tree().physics_frame
		await get_tree().physics_frame
		if not _hit_round:
			found_place = true
