extends Node2D

const sprite_full = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_15/debugging_character.png"
const audio_path = "res://assets/audio/dialog_sound.wav"
const npc_name = "Vii"

@export var dialog:Node

var river_runner_scene : PackedScene = preload("res://scenes/minigames/riverrunner/river_runner.tscn")
var layer : CanvasLayer = null
var finished := false
var npc_ref : CharacterBody2D = null

func start(npc:CharacterBody2D)->void:
	if finished or layer != null:
		return
	if dialog == null:
		return
	npc_ref = npc
	dialog.queue_text("Ahhh, Hii ",sprite_full,npc_name,audio_path)
	dialog.queue_text("This is my first time making a game",sprite_full,npc_name,audio_path)
	dialog.queue_text("Do you wanna try it?",sprite_full,npc_name,audio_path)
	dialog.queue_choice(["Try","Act dumb and ignore"],sprite_full,npc_name,player_chose)
	Globals.objective.title = "Game"
	Globals.objective.description = "Avoid Obstacles"

func player_chose(choice:int)->void:
	if choice==0:
		game_start()
	else:
		pass

func game_start() -> void:
	if finished:
		return
	SceneManager.go_to_scene("res://scenes/minigames/riverrunner/river_runner.tscn")
