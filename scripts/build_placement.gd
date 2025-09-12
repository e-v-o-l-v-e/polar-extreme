extends TileMapLayer

var effect_size : int = 5
var celle_array : Array[Vector2i] = []
var previous_mouse_pos : Vector2i = Vector2i(-100, -100) 

func _input(_event: InputEvent) -> void:
	var mouse_pos_glob: Vector2 = get_global_mouse_position()
	var mouse_pos_grid: Vector2 = to_local(mouse_pos_glob)
	var tile_under_mouse_pos: Vector2i = local_to_map(mouse_pos_grid)
	
	if tile_under_mouse_pos != previous_mouse_pos:
		for cell_pos in celle_array:
			set_cell(cell_pos, 0, Vector2i(0, 0)) 
		
		celle_array.clear()
		previous_mouse_pos = tile_under_mouse_pos
	
	if _event is InputEventMouseButton:
		if _event.button_index == MOUSE_BUTTON_LEFT:
			print("")
			#print(tile_under_mouse_pos)
			#print(celle_array)
	
	for i in range(int(-effect_size/2), int(effect_size/2) + 1):
		for j in range(int(-effect_size/2), int(effect_size/2) + 1):
			var pos: Vector2i = tile_under_mouse_pos + Vector2i(i, j)
			if not celle_array.has(pos):
				set_cell(pos, 0, Vector2i(2, 0))
				celle_array.append(pos)
