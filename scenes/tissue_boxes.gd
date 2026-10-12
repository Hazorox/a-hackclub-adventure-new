# container script
extends Node2D

@onready var spawning_timer: Timer = $"Spawning Timer"
var tissue_box_scene: PackedScene = preload("res://scenes/tissue_box.tscn")
var current_box: Node = null

func _ready() -> void:
	spawning_timer.start()

func _on_spawning_timer_timeout() -> void:
	if current_box != null and is_instance_valid(current_box):
		return
	current_box = tissue_box_scene.instantiate()
	add_child(current_box)
