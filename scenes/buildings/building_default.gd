extends base_building
func _ready() -> void:
	var sprited = preload("res://assets/ground/base.png")
	init(Vector2i(10, 10), sprited)
