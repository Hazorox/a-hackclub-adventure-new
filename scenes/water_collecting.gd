extends Node2D

var water_drops_scene : PackedScene = preload("res://scenes/pure_water_drops.tscn")
var contaminated_scene : PackedScene = preload("res://scenes/contaminated_water.tscn")
var score := 0

func _process(delta: float) -> void:
	$Label.text = "Score :" + str(score)

func _on_spawning_timer_timeout() -> void:
	spawn_water_drops()

func spawn_water_drops() -> void:
	var water_drops := water_drops_scene.instantiate()
	$WaterDrops.add_child(water_drops)

func _on_contaminated_spawner_timeout() -> void:
	var contaminated_drops := contaminated_scene.instantiate()
	$WaterDrops.add_child(contaminated_drops)

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("pure"):
		score += 1
	elif area.is_in_group("contaminated"):
		score -= 2
