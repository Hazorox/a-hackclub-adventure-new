extends CharacterBody2D

const SPEED = 500

func _physics_process(delta: float) -> void:
	var direction := Input.get_axis("water_left", "water_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	velocity.y = 0
	move_and_slide()
