extends TileMapLayer

@export var effect_size: int = 3

@export var building_data: Building = preload("res://ressources/buildings/Toilets.tres")

@export var building_scene: PackedScene = preload("res://scenes/base_building.tscn")

var celle_array: Array[Vector2i] = []
var can_be_placed: bool = true
var preview: Sprite2D


func _ready() -> void:
	preview = $preview
	if building_data and building_data.sprite:
		preview.texture = building_data.sprite
		preview.modulate = Color(1, 1, 1, 0.5)
	else:
		push_warning("Pas de sprite dans la Resource Building.")






func _input(event: InputEvent) -> void:


	if Input.is_key_pressed(KEY_R):
		preview.rotate(PI/2);
	if not (event is InputEventMouseMotion or event is InputEventMouseButton):
		return

	var mouse_pos_glob: Vector2 = get_global_mouse_position()
	var mouse_pos_grid: Vector2 = to_local(mouse_pos_glob)
	var tile_under_mouse_pos: Vector2i = local_to_map(mouse_pos_grid)
	var world_grid_pos: Vector2 = map_to_local(tile_under_mouse_pos)
	preview.position = world_grid_pos

	for cell_pos in celle_array:
		set_cell(cell_pos, 0, Vector2i(0, 0))
	celle_array.clear()

	can_be_placed = true

	var size = Vector2i(
		int(building_data.size.x) if building_data.size.x > 0 else effect_size,
		int(building_data.size.y) if building_data.size.y > 0 else effect_size
	)

	for i in range(-size.x / 2, size.x / 2 + 1):
		for j in range(-size.y / 2, size.y / 2 + 1):
			var pos: Vector2i = tile_under_mouse_pos + Vector2i(i, j)
			celle_array.append(pos)
			var cell_world_pos: Vector2 = map_to_local(pos)
			if _cell_collides(cell_world_pos):
				set_cell(pos, 0, Vector2i(1, 0)) 
				can_be_placed = false
			else:
				set_cell(pos, 0, Vector2i(2, 0))

	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
		_place_building(world_grid_pos)


func _place_building(world_grid_pos: Vector2) -> void:
	if not can_be_placed:
		return

	var instance = building_scene.instantiate() as BaseBuilding
	instance.rotation = preview.rotation
	instance.position = world_grid_pos
	instance.data = building_data.duplicate()
	get_parent().add_child(instance)
	instance.apply_data()
	print(building_data.building_name)


func _cell_collides(cell_world_pos: Vector2) -> bool:
	var space_state = get_world_2d().direct_space_state
	var cell_size = tile_set.tile_size

	var rect_shape = RectangleShape2D.new()
	rect_shape.size = cell_size

	var query = PhysicsShapeQueryParameters2D.new()
	query.shape = rect_shape
	query.transform = Transform2D(0, cell_world_pos)
	query.collide_with_areas = true
	query.collide_with_bodies = true
	query.exclude = [self]

	var result = space_state.intersect_shape(query, 1)
	return result.size() > 0
