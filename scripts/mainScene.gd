extends Node2D

func _ready() -> void:
	BuildingManager.BuildingPlacer = $PlacementGrid
	$btnBuilding1.pressed.connect(BuildingManager.instantiate_and_place_new_building.bind("IceMine"))
	$btnBuilding2.pressed.connect(BuildingManager.instantiate_and_place_new_building.bind("Cantine"))
	
