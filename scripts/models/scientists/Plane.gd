extends Node2D
class_name ScientistPlane

const SPEED : int = 200
const LIMIT : int = -500

var anim : bool
var scientist_spawn_pos : Vector2
var signal_emited : bool

@onready var audio: AudioStreamPlayer2D = $AudioStreamPlayer2D

signal make_scientist
signal anim_end

func _ready() -> void:
	visible = false
	anim = false 
	signal_emited = false
	audio.stream_paused = true

func start_animation(start_pos : Vector2, scientist_spawn : Vector2):
	global_position = start_pos
	visible = true
	anim = true
	scientist_spawn_pos = scientist_spawn
	audio.stream_paused = false
	
func _process(delta: float) -> void:
	if anim:
		audio.stream_paused = false
		global_position.x += -SPEED * delta
		if global_position.x < scientist_spawn_pos.x and not signal_emited:
			make_scientist.emit()
			signal_emited = true
		if global_position.x < LIMIT:
			visible = false
			anim = false
			signal_emited = false
			anim_end.emit()
			audio.stream_paused = true
