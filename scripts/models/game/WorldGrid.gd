extends TileMapLayer
class_name WorldGrid

@onready var scientist_spawn_position: Marker2D = $ScientistSpawnPosition
@onready var scientist_container = $ScientistContainer
@onready var building_container = $BuildingContainer

func get_scientist_spawn_position() -> Vector2:
	return scientist_spawn_position.global_position

func add_scientist(scientist_scene : Scientist) :
	scientist_scene.global_position = scientist_spawn_position.global_position
	scientist_container.add_child(scientist_scene)

func add_building(building_scene : Building):
	building_container.add_child(building_scene)
