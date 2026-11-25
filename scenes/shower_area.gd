extends TileMapLayer

@onready var game_shower = $"../WaterCollecting"

var player_in_range := false

func _process(_delta: float) -> void:
	if player_in_range and Globals.tissue_boxes_owned >= 1 and Input.is_action_just_pressed("interact"):
		game_shower.visible = true
		print("one piece")

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		player_in_range = true

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		player_in_range = false
		Globals.is_player_showering = false
