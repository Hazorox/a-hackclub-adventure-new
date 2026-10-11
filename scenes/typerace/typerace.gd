extends CanvasLayer

signal finished(won:bool)
const phrases = [
	"But it works on my machine",
	"git commit -m 'No Idea'",
	"Have you tried clearing cache",
	"Let's shout Hackclub",
	"Just one more can of caffeine",
	"Trust me bro we will make it in time",
	"Tung Tung Tung Sahur"
]
const target_wpm := 50
var queue:Array=[]
var current := ""
var chars := 0
var start_ms :=0
var running :=false

@onready var phrase_label:RichTextLabel = $PanelContainer/VBoxContainer/phrase
@onready var input:LineEdit = $PanelContainer/VBoxContainer/input
@onready var stats:Label = $PanelContainer/VBoxContainer/stats


func start():
	var pool = phrases.duplicate()
	pool.shuffle()
	queue=pool.slice(0,5)
	chars =0
	start_ms=0
	visible=true
	running=true
