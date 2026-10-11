extends Node2D

const sprite_path = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_9/character_9_frame16x20.png"
const npc_name = "Steve"
const audio_path = "res://assets/audio/dialog_sound.wav"

@onready var dialog = get_parent().get_node("dialog")
@onready var charger = $Charger

func start():
	dialog.queue_text("Hey Hey!! I lost my charger... Can you help ?",sprite_path,npc_name,audio_path)
	dialog.queue_choice(["Help","Ignore"],sprite_path,npc_name,player_chose)

func player_chose(choice:int):
	if choice==0:
		dialog.queue_text("Alright, search around using this little detector!!",sprite_path,npc_name,audio_path)
		await dialog.finished
		Globals.objective.description = "Find Steve's Charger"
		Globals.detector_on=true
		await charger.finished
		dialog.queue_text("Thanks for help !!!",sprite_path,npc_name,audio_path)
		await dialog.finished
		Globals.detector_on=false
		Globals.friends+=1
		Globals.objective.description = "Wander Around"
