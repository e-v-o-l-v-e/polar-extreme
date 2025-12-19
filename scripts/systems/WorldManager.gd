extends Node
class_name WorldManager

var world_grid : WorldGrid


func place_building(building : Building):
	world_grid.add_building(building)
	
func place_path(path : Path):
	world_grid.add_child(path)
	
func place_scientist(scientist):
	world_grid.add_scientist(scientist)
