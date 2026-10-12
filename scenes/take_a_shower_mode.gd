extends Node2D

var collect_water_scene : PackedScene = preload("res://scenes/water_collecting.tscn")
var layer : CanvasLayer = null
var finished := false

func start() -> void:
	if layer != null or finished:
		return
	layer = CanvasLayer.new()
	layer.layer = 100
	add_child(layer)
	var collect_water := collect_water_scene.instantiate()
	layer.add_child(collect_water)
	collect_water.tree_exited.connect(func():
		layer.queue_free()
		layer = null
		finished = true)
