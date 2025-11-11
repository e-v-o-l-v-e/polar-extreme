extends TileMapLayer
class_name WorldGrid

var occupied := {}
@export var cell_size := Vector2(64,64)

func world_to_grid(pos: Vector2) -> Vector2i:
	return Vector2i(floor(pos.x / cell_size.x), floor(pos.y / cell_size.y))

func grid_to_world(cell: Vector2i) -> Vector2:
	return Vector2(cell.x * cell_size.x, cell.y * cell_size.y)

func is_cell_free(cell: Vector2i) -> bool:
	return not occupied.has(cell)

func occupy_cell(cell: Vector2i, building_id: int):
	occupied[cell] = building_id
