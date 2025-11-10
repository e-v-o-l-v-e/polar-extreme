class_name BuildingManager
extends Node

static var _next_id := 1
static var _buildingsIds := {}

static var BuildingPlacer : BuildPlacement


static var _buildingsPositions = {
	Enums.BUILDING_TYPE.TOILET: [],
	Enums.BUILDING_TYPE.DORMITORY: [],
	Enums.BUILDING_TYPE.CANTEEN: [],
	Enums.BUILDING_TYPE.LABO: [],
	Enums.BUILDING_TYPE.SHOWER: []
}

static var buildings_scenes = {
	"IceMine" : preload("res://scenes/buildings/instanciables/IceMine.tscn"),
	"Shower" : preload("res://scenes/buildings/instanciables/ShowerBlock.tscn"),
	"Toilet" : preload("res://scenes/buildings/instanciables/Toilet.tscn"),
	"Cantine" : preload("res://scenes/buildings/instanciables/Canteen.tscn")
}

static func instantiate_building(building : String) -> Building :
	if buildings_scenes.has(building):
		return buildings_scenes[building].instantiate()
	else :
		return null

static func add_building(building: Building) -> void:
	var btype = building.get_building_type()
	if not _buildingsPositions.has(btype):
		_buildingsPositions[btype] = []
	_buildingsPositions[btype].append(building.global_position) 
	
static func register(new_building: Building):
	var id = _next_id
	_next_id += 1
	_buildingsIds[id] = new_building
	return id
	
static func remove(id: int):
	_buildingsIds.erase(id)

static func get_closest_building(building_type : Enums.BUILDING_TYPE, npc_position : Vector2) -> Vector2:
	var closest_position : Vector2 = _buildingsPositions[building_type]
	for position : Vector2 in _buildingsPositions[building_type]:
		if(position.distance_to(npc_position) < closest_position.distance_to(npc_position)):
			closest_position = position
	return closest_position
	
static func get_building(id: int)->Building:
	if(_buildingsIds.is_empty()):
		return null
	return _buildingsIds[id]


static func instantiate_and_place_new_building(nameOfTheBuilding:String):
	if(BuildingPlacer and buildings_scenes.has(nameOfTheBuilding)):
		BuildingPlacer.start_building(instantiate_building(nameOfTheBuilding))
	
