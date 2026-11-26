extends Node2D

const sprite_full = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_15/debugging_character.png"
const audio_path = "res://assets/audio/dialog_sound.wav"
const npc_name = "Vii"

@export var dialog:Node

const river_runner_path := "res://scenes/minigames/riverrunner/river_runner.tscn"
var finished := false
var npc_ref : CharacterBody2D = null

func start(npc:CharacterBody2D)->void:
	if finished:
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
	SceneManager.shower_taken.connect(_on_river_runner_done, CONNECT_ONE_SHOT)
	SceneManager.go_to_scene(river_runner_path)

func _on_river_runner_done(_returned_scene: Node) -> void:
	finished = true
	if npc_ref != null and is_instance_valid(npc_ref):
		npc_ref.queue_free()
