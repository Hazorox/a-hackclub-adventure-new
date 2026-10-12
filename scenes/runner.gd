extends Node2D

var debugging_scene : PackedScene = preload("res://scenes/runner/runner.tscn")
var layer : CanvasLayer = null
var finished := false

func start() -> void:
	if layer != null or finished:
		return
	layer = CanvasLayer.new()
	layer.layer = 100
	add_child(layer)
	var debugging := debugging_scene.instantiate()
	layer.add_child(debugging)
	debugging.tree_exited.connect(func():
		layer.queue_free()
		layer = null
		finished = true)
