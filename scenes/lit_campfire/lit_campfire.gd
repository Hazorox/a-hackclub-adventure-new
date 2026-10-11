extends Node2D
@onready var area_2d: Area2D = $Area2D
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
const sprite = "res://assets/SuperRetroWorld_CharacterPack_Full/sprite_split/character_33/character_33_frame16x20.png"
const audio = "res://assets/audio/wemmbu-mace.mp3"
const npc_name = "Wemmbu"
@export var dialog:Node
var player_in_range = false
var can_light = false
var is_lit = false

func _ready() -> void:
	animated_sprite_2d.play("na")
	area_2d.body_entered.connect(enter)
	area_2d.body_exited.connect(exit)
	
func enter(body: Node):
	print("entered: ", body.name, " groups: ", body.get_groups())
	if body.is_in_group("player"):
		player_in_range = true
		
func exit(body: Node):
	if body.is_in_group("player"):
		player_in_range = false

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("interact"):
		print("interact pressed | in_range: ", player_in_range, " | can_light: ", can_light, " | lit: ", is_lit)
	if can_light and not is_lit and player_in_range and Input.is_action_just_pressed("interact"):
		is_lit = true
		animated_sprite_2d.play("lit")

func start():
	print(self, " path: ", get_path(), " dialog: ", dialog)
	if dialog == null:
		return
	dialog.queue_text("Hello Fellow chungus",sprite,npc_name,audio)
	dialog.queue_text("I am Wemmbu, the strongest player on the unstable SMP",sprite,npc_name,audio)
	dialog.queue_text("So Egg asked me to light the campfire outside",sprite,npc_name,audio)
	dialog.queue_text("But lowkey I am too lazy to do that",sprite,npc_name,audio)
	dialog.queue_text("So I'll give u my Orbital Strike Cannon to light the campfire",sprite,npc_name,audio)
	dialog.queue_choice(["take the orbital", "Ignore him"],sprite,npc_name,player_chose)
	Globals.objective.title = "Campfire"
	Globals.objective.description = "Light the campfire in the autumn garden"

func player_chose(choice:int)->void:
	if choice==0:
		if Globals.garbage_mode_on:
			return
		else:
			can_light = true
			dialog.queue_text("I knew I could count on u, random chungus",sprite,npc_name,audio)
			Globals.garbage_mode_on=true
	else:
		pass
