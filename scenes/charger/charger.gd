extends Area2D
signal finished
var player:CharacterBody2D = null
const max_dist := 600.0
const min_db := -40.0
const max_db := 0.0
@onready var audio = $audio
func _process(_delta: float) -> void:
	if player==null:
		player = Globals.player
	else:
		var distance = global_position.distance_to(player.global_position)
		print(distance)
		# Got this formula logic from Claude
		var closeness = 1.0-clampf(distance/max_dist,0.0,1.0)
		audio.volume_db = lerpf(min_db,max_db,closeness)
		audio.volume_linear = closeness*closeness
func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		finished.emit()
