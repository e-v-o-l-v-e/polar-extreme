extends MarginContainer

@export var projectScene : PackedScene

@onready var lbl_name: Label = $NinePatchRect/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/lblName
@onready var projet_container: VBoxContainer = $NinePatchRect/VBoxContainer/VBoxContainer/ScrollContainer/projetContainer

@onready var lbl_desc: Label = $NinePatchRect/VBoxContainer/MarginContainer/VBoxContainer/lblDesc
@onready var pop_desc_building: Popup = $popDescBuilding
@onready var lbl_nbr: Label = $NinePatchRect/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer2/lblNbr

var buil : Building
var nombreScientifiques := 0


# Called when the node enters the scene tree for the first time.
func _enter_tree():
	UiController.click_on_building.connect(_on_click_on_building)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_click_on_building(building : Building):
	buil = building
	
	lbl_name.text = building.get_building_name()
	
	lbl_desc.text = GameController.get_building_description(building.building_type)
	
	var liste = GameController.get_projects_manager().get_list(building.building_type, building)
	
	for proj in projet_container.get_children() :
		projet_container.remove_child(proj)
	
	for project in liste :
		var proj = projectScene.instantiate()
		projet_container.add_child(proj)
		
		proj.setName(project.get_project_name())
		
		proj.setStatus(project.get_project_state())
		
		proj.setVisibility(true)


func _on_btn_expl_pressed() -> void:
	pop_desc_building.visible = true
	pop_desc_building.setDesc(buil.building_description)


func _on_btn_rem_pressed() -> void:
	if nombreScientifiques > 0:
		UiController.emit_deassign_scientist()
	
		nombreScientifiques -= 1
		lbl_nbr.text = str(nombreScientifiques)


func _on_btn_add_pressed() -> void:
	UiController.emit_assign_scientist()
	
	nombreScientifiques += 1
	lbl_nbr.text = str(nombreScientifiques)


func _on_desassignation_pressed() -> void:
	if nombreScientifiques > 0:
		UiController.emit_deassign_scientist()
	
		nombreScientifiques -= 1
		lbl_nbr.text = str(nombreScientifiques)
