class_name Project
extends Node

var project_name: String
var project_id := -1
var project_description: String		# TODO
var project_state: int:
	set (value):
		project_state = max(value, 0)	# 0: created, 1: running, 2: paused, 3: finished

var building : BuildingScience	# associated building

var requirement_scientists: int = 3 	# number of scientifics required for the project
var project_time: int:
	set(value):
		project_time = max(value, 0)

var failure_chances: int:			# chance of success, integer between 0 and 100, MOST PROBABLY WONT BE IMPLEMENTED
	set(value):
		failure_chances = clamp(value, 0, 100)

var reward_science 					# one time flat amount of science 
var reward_production				# per second science increase
var reward_slots					# number of scientist allowed to work at the same time
var reward_pollution				# one time flat amount of pollution
var reward_pollution_per_second		# per second pollution increase
var reward_wellness := 0.05			# one time flat amount of wellness

func _init(pid: int, pname: String, rew_sci: int, rew_prod: int, rew_sl: int, rew_poll: int, rew_poll_ps: int, req_sci: int, req_time: int) -> void:
	project_id = pid
	project_name = pname
	reward_science = rew_sci
	reward_production = rew_prod
	reward_slots = rew_sl
	reward_pollution = rew_poll
	reward_pollution_per_second = rew_poll_ps
	project_state = 0
	requirement_scientists = req_sci
	project_time = req_time
	
func set_building(b: BuildingScience) -> void:
	building = b

func console(string: String) -> void:
	print(building.get_building_name() + ": " + string + " project " + project_name)
	
func copy() -> Project:
	var new_project = Project.new(
		project_id,
		project_name,
		reward_science,
		reward_production,
		reward_slots,
		reward_pollution,
		reward_pollution_per_second,
		requirement_scientists,
		project_time
	)
	return new_project

func start():
	if project_state == 0:
		GameController.scientist_manager.change_scientists_assigned(requirement_scientists)
		project_state = 1
	elif project_state == 2:
		project_state = 1

	
func pause():
	if project_state == 1:
		project_state = 2
	
func finish():
	GameController.scientist_manager.change_scientists_assigned(-requirement_scientists)
	project_state = 3
	
	building.change_pollution(reward_pollution_per_second)
	building.change_science_per_second_production(reward_production)
	building.scientists_add_slots(reward_slots)
	
	var gauges = GameController.get_gauges()
	gauges.change_wellness(reward_wellness)
	gauges.change_pollution(reward_pollution)
	gauges.change_science(reward_science)

	
func get_time_total() -> int:
	return project_time
	
func get_project_name() -> String:
	return project_name
	
func get_description() -> String:
	return project_description

func get_project_state() -> int:
	return project_state


#testttt
func set_time(time : int) -> void :
	project_time = time
