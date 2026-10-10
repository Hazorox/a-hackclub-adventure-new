extends Node2D

const sprite_path = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_18/Flowery.png"
const npc_name = "Flowery"
const audio_path = "res://assets/audio/flowery.wav"
@export var dialog:Node

func start(_player:CharacterBody2D)->void:
	dialog.queue_text("Don't worry MY DEAR FRIEND !!!",sprite_path,npc_name,audio_path)
	dialog.queue_text("Im Flowery, I am your friend, and you must accept it",sprite_path,npc_name,audio_path)
