extends Node

# Variables
var rhythem_score : int = 0
var player:CharacterBody2D = null
var objective := {"title":"first_talk","description":"Strike up a talk with someone"}
var _timer:Timer
var rubbish_in_hand :=false
var rubbish_score := 0
var garbage_mode_on :=false
var friends = 0
var caffeine_on := false
var caffeine_time =25
var caffeine_in_time :=false
var caffeine_done:=false
var flowery_done :=false
var tissue_boxes_owned := 0

var detector_on :=false
func _ready()->void:
	_timer = Timer.new()
	_timer.wait_time = 0.5
	_timer.one_shot = false
	_timer.timeout.connect(_on_tick_timer)
	add_child(_timer)

func _process(_delta:float)->void:
	if player==null:
		player = get_tree().get_first_node_in_group("player")
	if rubbish_score==10:
		garbage_mode_on=false

func start_caffeine_timer()->void:
	_timer.start()

func _on_tick_timer()->void:
	caffeine_time -=1
	if caffeine_time <= 0 :
		_timer.stop()
