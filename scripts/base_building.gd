extends Node2D
class_name base_building

var CollisionShape : CollisionShape2D
var sprite : Sprite2D
var _size: Vector2i
var _sprite_texture: Texture2D = null


func _ready() -> void:
	CollisionShape = $CollisionShape2D
	sprite = $building_sprite

	if _size != Vector2i.ZERO:
		_apply_size()
	if _sprite_texture:
		_apply_sprite()


func init(size: Vector2i, texture: Texture2D = null) -> void:
	if size == Vector2i.ZERO:
		push_error("Size null")
		return

	_size = size
	_sprite_texture = texture

	if CollisionShape:
		_apply_size()
	if sprite and _sprite_texture:
		_apply_sprite()


func _apply_size() -> void:
	if CollisionShape and CollisionShape.shape is RectangleShape2D:
		CollisionShape.shape.extents = _size / 2.0



func _apply_sprite() -> void:
	sprite.texture = _sprite_texture
	
func _set_position(pos: Vector2):
	var grid_pos = Vector2(pos)  
	position = grid_pos

	
