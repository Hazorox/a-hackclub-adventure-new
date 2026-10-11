extends CharacterBody2D

const speed = 250.0
func _ready():
	collision_mask=3
func _physics_process(_delta: float) -> void:
	var direction = Input.get_vector("alt_left","alt_right","alt_up","alt_down").normalized()
	velocity = speed*direction
	move_and_slide()
