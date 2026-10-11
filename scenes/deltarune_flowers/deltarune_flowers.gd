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
	await dialog.finished
	if layer != null or finished:
		return
	layer = CanvasLayer.new()
	layer.layer = 100
	add_child(layer)
	var scene = exported_scene.instantiate()
	layer.add_child(scene)
	var player_cam := scene.find_child("Camera2D",true,false) as Camera2D
	if player_cam:
		player_cam.make_current()
	
	scene.tree_exited.connect(func():
		if is_instance_valid(player_cam) and player_cam.is_inside_tree():
			player_cam.enabled=true
			player_cam.make_current()
		layer.queue_free()
		layer = null
		finished = true)

func _process(_delta:float):
	if Globals.flowery_done:
		var flowery = get_parent().get_node("Flowery")
		if flowery:
			flowery.queue_free()
