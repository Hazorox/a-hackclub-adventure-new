extends CharacterBody2D

func _physics_process(delta: float) -> void:
	var speed := 200
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
	move_and_slide()
	print("Boat at: ", global_position)
