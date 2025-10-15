class_name BuildingSelector
extends Node

var building_scenes = [
	preload("res://scenes/buildings/buildings/IceMine.tscn"),
	preload("res://scenes/buildings/buildings/ShowerBlock.tscn"),
	preload("res://scenes/buildings/buildings/Toilet.tscn")
]

func _ready() -> void: 
	for scene in building_scenes:
		var btn = Button.new()
		btn.icon = scene.get_icon()
		btn.connect("pressed", Callable(self, "_on_building_selected").bind(scene))
