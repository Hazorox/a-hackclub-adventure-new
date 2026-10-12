extends CharacterBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	var speed := 200
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * speed
	else:
		velocity.x = move_toward(velocity.x, 0, speed)
		
	if direction == 0:
		animation_player.play("idle")
	elif direction < 0:
		animation_player.play("boat_heading_left")
	elif direction > 0:
		animation_player.play("boat_heading_right")
		
	move_and_slide()
