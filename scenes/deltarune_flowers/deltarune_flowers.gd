extends Node2D

# Constants for Flowery assets
const sprite_path = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_18/Flowery.png"
const npc_name = "Flowery"
const audio_path = "res://assets/audio/flowery.wav"
# Get dialog node
@onready var dialog = get_parent().get_node("dialog")
# Override main scene using layer and finished vars
var layer:CanvasLayer = null
var finished := false
var to_run = true

# Get the scene to override with
@export var exported_scene : PackedScene
func start()->void:
	# Dialogue
	dialog.queue_text("Don't worry MY DEAR FRIEND !!!",sprite_path,npc_name,audio_path)
	dialog.queue_text("Im Flowery, I am your friend, and you must accept it",sprite_path,npc_name,audio_path)
	# Wait for dialog finish
	await dialog.finished
	# Override logic, taken from Vii's overriding script
	if layer != null or finished:
		return
	layer = CanvasLayer.new()
	layer.layer = 100
	add_child(layer)
	var scene = exported_scene.instantiate()
	layer.add_child(scene)
	# Fix cam issues by using one cam instead of creating a new one, and changing it every once
	var player_cam := scene.find_child("Camera2D",true,false) as Camera2D
	if player_cam:
		player_cam.make_current()
	
	# Once the game mode ends, return the cam and remove the overriding layer
	scene.tree_exited.connect(func():
		if is_instance_valid(player_cam) and player_cam.is_inside_tree():
			player_cam.enabled=true
			player_cam.make_current()
		layer.queue_free()
		layer = null
		finished = true)

func _process(_delta:float):
	# If the gamemode ends, get Flowery Node and remove
	if Globals.flowery_done and to_run:
		var flowery = get_parent().get_node("Flowery")
		if flowery:
			flowery.queue_free()
			Globals.friends+=1
			Globals.objective.title="wander"
			Globals.objective.description = "Wander Around !!"
			to_run = false
