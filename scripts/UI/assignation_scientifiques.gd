extends MarginContainer

@onready var nom: Label = $MarginContainer/nine/MarginContainer/HBoxContainer/nom
@onready var nombre_scient: Label = $MarginContainer/nine/MarginContainer/HBoxContainer/nombreScient


var nombreScientifiques = 0

func setName(text : String) :
	nom.text = text

func setVisibility(vis : bool) :
	visible = vis

func _process(delta: float) -> void:
	pass

func _ready() -> void:
	pass



func _on_assignation_pressed() -> void:
	UiController.emit_assign_scientist()
	
	nombreScientifiques += 1
	nombre_scient.text = str(nombreScientifiques)


func _on_desassignation_pressed() -> void:
	if nombreScientifiques > 0:
		UiController.emit_deassign_scientist()
	
		nombreScientifiques -= 1
		nombre_scient.text = str(nombreScientifiques)
