extends Node2D
const sprite_full = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_17/Timo.png"
const audio_path = "res://assets/audio/dialog_sound.wav"
const npc_name = "Timo"
@export var rubbish_item:PackedScene
@export var dialog:Node
var elap = 0.0
var on = false
var started := false

func _process(delta: float) -> void:
	if on:
		elap += delta
		if elap >= 60.0:          # == on a float almost never hits
			on = false
			dialog.queue_text("u took too long", sprite_full, npc_name, audio_path)
			queue_free()

func start() -> void:
	print("HER HERE, dialog = ", dialog)
	if started or dialog == null:
		return
	started = true
	on = true 
	dialog.queue_text("Hey!!, I am Timo",sprite_full,npc_name,audio_path)
	dialog.queue_text("67 67 67 67",sprite_full,npc_name,audio_path)
	dialog.queue_text("anyways.. wanna try solve my trivia",sprite_full,npc_name,audio_path)
	dialog.queue_choice(['"sure"','"nah, I am good"'],sprite_full,npc_name,player_chose)
	Globals.objective.title = "Trivia"
	Globals.objective.description = "Solve timo's trivia"
	
func player_chose(choice:int)->void:
	if choice==0:
		dialog.queue_text("What is the Capital of Egypt",sprite_full,npc_name,audio_path)
		dialog.queue_choice(["Cape Town","Cairo", "Giza"],sprite_full,npc_name,c1)
	else:
		pass
		
func c1(choice:int)->void:
	if choice==1:
		dialog.queue_text("Which of those was the event hosted in Cairo",sprite_full,npc_name,audio_path)
		dialog.queue_choice(["Horizons Equinox","Stardance", "Expedition"],sprite_full,npc_name,c2)
	else:
		dialog.queue_text("wrong answer :(",sprite_full,npc_name,audio_path)
		pass
		
func c2(choice:int)->void:
	if choice==0:
		dialog.queue_text("who is one of its orgs which also ran a team-based YSWS",sprite_full,npc_name,audio_path)
		dialog.queue_choice(["markalmax","KWI", "lou"],sprite_full,npc_name,c3)
	else:
		dialog.queue_text("wrong answer :(",sprite_full,npc_name,audio_path)
		pass
		
func c3(choice:int)->void:
	if choice==2:
		dialog.queue_text("u won!!!!!!!!!",sprite_full,npc_name,audio_path)
		Globals.friends += 1
		queue_free()
		return
	else:
		dialog.queue_text("wrong answer :(",sprite_full,npc_name,audio_path)
		pass
	
