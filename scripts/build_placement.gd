extends TileMapLayer

var effect_size : int = 5
var celle_array : Array[Vector2i] = []
var previous_mouse_pos : Vector2i = Vector2i(-100, -100) 

var house_scene = preload("res://scenes/buildings/building-default.tscn")





func _input(_event: InputEvent) -> void:
	var mouse_pos_glob: Vector2 = get_global_mouse_position()
	var mouse_pos_grid: Vector2 = to_local(mouse_pos_glob)
	var tile_under_mouse_pos: Vector2i = local_to_map(mouse_pos_grid)
	var world_grid_pos = map_to_local(tile_under_mouse_pos)
	var global_grid_pos = to_global(world_grid_pos)
	
	if tile_under_mouse_pos != previous_mouse_pos:
		for cell_pos in celle_array:
			set_cell(cell_pos, 0, Vector2i(0, 0)) 
		
		celle_array.clear()
		previous_mouse_pos = tile_under_mouse_pos
	
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT:
			var test = house_scene.instantiate()
			test._set_position(global_grid_pos)
			add_child(test)
	
	for i in range(int(-effect_size/2), int(effect_size/2) + 1):
		for j in range(int(-effect_size/2), int(effect_size/2) + 1):
			var pos: Vector2i = tile_under_mouse_pos + Vector2i(i, j)
			if not celle_array.has(pos):
				set_cell(pos, 0, Vector2i(2, 0))
				celle_array.append(pos)
