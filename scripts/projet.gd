extends MarginContainer

@export var nom : Label
@export var timeLeft : Label
@export var timePercentage : ProgressBar
@export var timer : Timer

var ID
var time = 30


func setName(text : String) :
	nom.text = text
	ID = int(text)

func setVisibility(vis : bool) :
	visible = vis

func _process(delta: float) -> void:
	timePercentage.value = timer.wait_time - timer.time_left
	timeLeft.text = "%d:%02d" % [floor(timer.time_left / 60), int(timer.time_left) % 60]	# pour afficher au format min:sec

func _ready() -> void:
	timer.start(time)	# temps en secondes
	timePercentage.max_value = time
