extends MarginContainer

@export var projectScene : PackedScene

@onready var projet_container: VBoxContainer = $NinePatchRect/VBoxContainer/ScrollContainer/projetContainer

@onready var lbl_name = $NinePatchRect/VBoxContainer/MarginContainer/VBoxContainer/HBoxContainer/lblName


var aaaa = false
# Called when the node enters the scene tree for the first time.
func _enter_tree():
	UiController.click_on_building.connect(_on_click_on_building)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func _on_click_on_building(building : Building):
	lbl_name.text = building.get_building_name()
	
	
	var liste = GameController.get_projects_manager().get_list(building.building_type, building)
	
	for project in liste :
		var proj = projectScene.instantiate()
		projet_container.add_child(proj)
		
		proj.setName(project.get_project_name())
		proj.setVisibility(true)
