extends Popup


@onready var lbl_desc: Label = $NinePatchRect/MarginContainer/lblDesc


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func setDesc(text : String) -> void:
	lbl_desc.text = text
