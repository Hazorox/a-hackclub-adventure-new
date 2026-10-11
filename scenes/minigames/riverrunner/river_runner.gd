extends Node2D

var rock_obstacle_1_scene : PackedScene = preload("res://scenes/minigames/riverrunner/rocks_1_obstacle.tscn")
var rock_obstacle_2_scene : PackedScene = preload("res://scenes/minigames/riverrunner/rocks_2_obstacle.tscn")
var depth_obstacle_1_scene : PackedScene = preload("res://scenes/minigames/riverrunner/depth_1_obstacle.tscn")
var depth_obstacle_2_scene : PackedScene = preload("res://scenes/minigames/riverrunner/depth_2_obstacle.tscn")
var obstacles_scene : Array = [
	rock_obstacle_1_scene,
	rock_obstacle_2_scene,
	depth_obstacle_1_scene,
	depth_obstacle_2_scene,
]

func _ready() -> void:
	pass

func spawn_obstacles() -> void:
	var obstacle = obstacles_scene.pick_random().instantiate()
	var random_x = 0
	var valid_position = false
	var max_attempts = 10
	var player = get_tree().get_first_node_in_group("player")
	for i in range(max_attempts):
		random_x = randi_range(430, 620)
		valid_position = true
		if player and abs(player.global_position.x - random_x) < 70:
			valid_position = false
			continue
		for existing_obstacle in $Obstacles.get_children():
			if abs(existing_obstacle.global_position.x - random_x) < 60:
				valid_position = false
				break
		if valid_position:
			break
	$Obstacles.add_child(obstacle)
	obstacle.global_position.x = random_x
	obstacle.global_position.y = -60

func _on_obstcale_spawner_timeout() -> void:
	spawn_obstacles()
