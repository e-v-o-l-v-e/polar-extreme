extends Node2D

func _ready():
	GameController.set_grid(%WorldGrid)
	var instance: Path = load("res://scenes/buildings/Path.tscn").instantiate()
	var mouse_pos_grid: Vector2 = to_local(Vector2(250,250))
	var tile_under_mouse: Vector2i = $PlacementGrid.local_to_map(mouse_pos_grid)
	var world_grid_pos: Vector2 = $PlacementGrid.map_to_local(tile_under_mouse)
	instance.position = world_grid_pos
	instance.name = "Path" + str(0)
	%PathRegions.add_child(instance)

func _on_button_4_pressed() -> void:
	UiController.emit_start_delete_object()
