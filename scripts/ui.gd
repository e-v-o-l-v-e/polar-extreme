extends Control
# https://www.kodeco.com/45869762-making-responsive-ui-in-godot/
# https://kidscancode.org/godot_recipes/4.x/ui/level_select/index.html

@export var menu_projet: Control



func _on_button_projets_pressed() -> void:
	if (!menu_projet.visible):
		menu_projet.visible = true
	else:
		menu_projet.visible = false
