extends Node
class_name TimeManager

var current_time := 0.0
var next_hour := 100.0
var time_speed := 20
var day_length := 2400

func process_time(delta : float) -> void :
	current_time += delta * time_speed
	if current_time > next_hour :
		next_hour += 100
		GameController.notify_scientist_new_hour((next_hour - 100) / 100)
		if current_time > day_length :
			current_time = 0
			next_hour = 0

func get_time_hours():
	return int(current_time / 60)

func get_time_minutes():
	return int(current_time) % 60

func get_formatted_time() -> String:
	var h = get_time_hours()
	var m = get_time_minutes()
	return "%02d:%02d" % [h, m]
