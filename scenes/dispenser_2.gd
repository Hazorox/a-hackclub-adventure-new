extends Area2D
func _ready()->void:
	body_entered.connect(player_entered)

func player_entered(body:Node2D)->void:
	if body.is_in_group("player") and  Globals.caffeine_on:
		Globals.caffeine_on=false
		Globals.caffeine_in_time=false
		Globals.friends+=1
		Globals.caffeine_done=true
		var chris = get_tree().get_first_node_in_group("caffeine")
		if chris:
			chris.queue_free()
