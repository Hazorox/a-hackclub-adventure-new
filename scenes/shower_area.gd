extends TileMapLayer

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("player"):
		print("8ms")
		if Globals.tissue_boxes_owned >= 1:
			Vget_parent().get_child("WaterCollecting")

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.is_player_showering = false
