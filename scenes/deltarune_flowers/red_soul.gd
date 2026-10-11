extends CharacterBody2D

const speed = 250.0
func _ready():
	collision_layer = 1<<7
	collision_mask = 1<<7
	motion_mode = CharacterBody2D.MOTION_MODE_FLOATING
func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("alt_left","alt_right","alt_up","alt_down").normalized()
	velocity = speed*direction
	move_and_slide()
