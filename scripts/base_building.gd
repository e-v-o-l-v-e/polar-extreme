@tool
@icon("res://assets/icon/building_icon.svg")
extends Area2D
class_name BaseBuilding

@onready var sprite: Sprite2D = $building_sprite
@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@export var data: Building

const TILE_SIZE: int = 32

func _ready() -> void:
	if data:
		apply_data()


func init(_pos: Vector2) -> void:
	z_index = 4
	position = _pos


func apply_data() -> void:
	if data.sprite:
		sprite.texture = data.sprite

	if data.size and data.size.x > 0 and data.size.y > 0:
		var rect_shape := RectangleShape2D.new()
		rect_shape.size = Vector2(data.size.x * TILE_SIZE-2, data.size.y * TILE_SIZE-2)
		collision_shape.shape = rect_shape
