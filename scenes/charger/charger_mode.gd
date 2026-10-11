extends Node2D

const sprite_path = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_9/character_9_frame16x20.png"
const npc_name = "Steve"
const audio_path = "res://assets/audio/dialog_sound.wav"

@onready var dialog = get_parent().get_node("dialog")


func start():
	dialog.queue_text("Hey Hey!! I lost my charger... Can you help ?",sprite_path,npc_name,audio_path)
	dialog.queue_choice(["Help","Ignore"],sprite_path,npc_name,player_chose)

func player_chose(choice:int):
	if choice==0:
		print("chose to help")
