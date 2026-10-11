extends Node2D

const sprite_path = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_18/Flowery.png"
const npc_name = "Flowery"
const audio_path = "res://assets/audio/flowery.wav"
@onready var dialog = get_parent().get_node("dialog")
var layer:CanvasLayer = null
var finished := false
@export var exported_scene : PackedScene
func start(_player:CharacterBody2D)->void:
	dialog.queue_text("Don't worry MY DEAR FRIEND !!!",sprite_path,npc_name,audio_path)
	dialog.queue_text("Im Flowery, I am your friend, and you must accept it",sprite_path,npc_name,audio_path)
	await get_tree().create_timer(4.67).timeout
	if layer != null or finished:
		return
	layer = CanvasLayer.new()
	layer.layer = 100
	add_child(layer)
	var scene = exported_scene.instantiate()
	layer.add_child(scene)
	scene.tree_exited.connect(func():
		layer.queue_free()
		layer = null
		finished = true)
	
