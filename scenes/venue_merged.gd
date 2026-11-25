extends Node2D

func _ready() -> void:
	SceneManager.shower_taken.connect(_on_shower_taken)

func _on_shower_taken(scene):
	if scene == self:
		Globals.is_player_showering = true
		var timer = Timer.new()
		timer.wait_time = 3.0
		timer.one_shot = true
		add_child(timer)
		timer.timeout.connect(_on_timer_timout)
		timer.start()
		print("timer_started")
		print(Globals.is_player_showering)

func _on_timer_timout(timer):
	Globals.is_player_showering = false
	print("timer_finished")
	print(Globals.is_player_showering)
	timer.queue_free()
	
