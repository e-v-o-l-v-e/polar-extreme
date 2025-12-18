class_name Gauges
extends Node

var science := 0.0:
	set(value):
		science = value
		UiController.emit_science_changed(science)
		
var science_per_seconds := 0.0:
	set(value):
		science_per_seconds = value
		UiController.emit_science_second_changed(science_per_seconds)

var pollution := 100.0:
	set(value):
		if value <= 0 :
			pollution = 0
		else:
			pollution = value
		UiController.emit_pollution_changed(pollution)
var pollution_per_seconds := 0.0:
	set(value):
		print("previous: " + str(pollution_per_seconds) + ", new: "   + str(value))
		pollution_per_seconds = value

var wellness := 110.0:
	set (value):
		wellness = clamp(value, wellness_min, wellness_max)
		UiController.emit_wellness_changed(wellness)
var wellness_max := 200.0
var wellness_min := 10.0

### GAUGES MANAGEMENT ##

# Science
func get_science() -> float:
	return science

func change_science(value: float) -> bool:
	if science + value >= 0:
		science += value
		return true
	else:
		return false

func get_science_per_second() -> float:
	return science_per_seconds

func change_science_per_second(value: float) -> void:
	science_per_seconds += value


## Pollution
func get_pollution() -> float:
	return pollution
	
func get_pollution_per_second() -> float:
	return pollution_per_seconds

func change_pollution(value: float) -> bool:
	if value > 0:
		# more wellness = less pollution gain (and the reverse)
		pollution += value * (100 / wellness)
	else:
		# more wellness = more pollution loss
		pollution += value * (wellness / 100)
		
	# gain 0.01 wellness per tick if pollution is 0
	if pollution <= 0:
		change_wellness(0.01)
	return true

func change_pollution_per_second(value: float) -> void:
	pollution_per_seconds += value

func set_pollution_per_second(value: float) -> void:
	pollution_per_seconds = value

# Wellness
func get_wellness() -> float:
	return wellness

func change_wellness(w: float) -> void:
	wellness += w

## UPDATE (every 2 seconds)
func update_gauges():
	change_science(science_per_seconds * GameController.update_time)
	change_pollution(pollution_per_seconds * GameController.update_time)
