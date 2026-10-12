extends TileMapLayer

func _on_area_2d_area_entered(area: Area2D) -> void:
	print("7ms")
	if area.is_in_group("player"):
		print("8ms")
		if Globals.tissue_boxes_owned >= 1:
			print("9ms")
			Globals.is_player_showering = true
			Globals.tissue_boxes_owned -= 1

func _on_area_2d_area_exited(area: Area2D) -> void:
	if area.is_in_group("player"):
		Globals.is_player_showering = false
