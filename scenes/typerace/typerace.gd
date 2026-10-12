extends CanvasLayer
# Finishing signal to recieve from the venue side
signal finished(won:bool)

# Phrases made by me :D
const phrases = [
	"but it works on my machine",
	"git commit -m 'No Idea'",
	"have you tried clearing cache",
	"let's shout Hackclub",
	"just one more can of caffeine",
	"trust me bro we will make it in time",
	"tung tung tung sahur",
	"guys guys guys gather gather",
	"i use arch btw",
	"yo 67 67 67 67",
	"snacks time"
]
# The opponent's avg wpm
const target_wpm := 50
# Logic management vars, queue of phrases and current phrase
var queue:Array=[]
var current := ""
var chars := 0
var start_ms :=0
var running :=false

# Phrase RichTextLabel, input, and stats label
@onready var phrase_label:RichTextLabel = $PanelContainer/VBoxContainer/phrase
@onready var input:LineEdit = $PanelContainer/VBoxContainer/input
@onready var stats:Label = $PanelContainer/VBoxContainer/stats

# work when paused to prevent player input
func _ready():
	input.text_changed.connect(_on_input_changed)
	process_mode = Node.PROCESS_MODE_WHEN_PAUSED

# Pause, setup phrases and game and grab focus
func start():
	get_tree().paused=true
	var pool = phrases.duplicate()
	pool.shuffle()
	queue=pool.slice(0,5)
	chars =0
	start_ms=0
	visible=true
	running=true
	input.editable = true
	stats.text = "Type the phrase. Target : %d WPM" % int(target_wpm)
	next_phrase()
	input.grab_focus()

# Move in queue of phrases
func next_phrase()->void:
	if queue.is_empty():
		finish()
		return
	current = queue.pop_front()
	input.text = ""
	render("")

# Render the new phrase using bb encoding
func render(txt:String):
	var bb := ""
	# color text to green if correct, otherwise red
	for i in current.length():
		var c = current[i]
		if i < txt.length():
			bb+=("[color=green]%s[/color]" if txt[i]==c else "[color=red]%s[/color]") % c
		else:
			bb+=c
	# add encoded text
	phrase_label.text = bb

# Get elapsed time
func elapsed_min()->float:
	return max((Time.get_ticks_msec()-start_ms)/60000.0,0.0001)

# On input change from user's end
func _on_input_changed(newTxt:String):
	if not running:
		return
	
	if start_ms ==0 and newTxt.length()>0:
		start_ms = Time.get_ticks_msec()
	render(newTxt)
	if newTxt == current:
		chars+=current.length()
		next_phrase()

# Once done revert everything and update stats and emit signal
func finish():
	running = false
	input.editable = false
	var wpm = (chars/5.0)/elapsed_min()
	var won = wpm >= target_wpm
	stats.text="%d WPM - %s"% [int(wpm),"You Win!" if won else "Too slow, try again"]
	finished.emit(won)


func _process(_delta:float):
	if running and start_ms!=0:
		var wpm = ((chars+input.text.length())/5.0)/elapsed_min()
		stats.text = "WPM: %d / %d" % [int(wpm),int(target_wpm)]
