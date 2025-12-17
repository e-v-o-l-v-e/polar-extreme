extends Node
class_name ScientistManager

var scientist_factory : ScientistFactory = load("res://scripts/factories/ScientistFactory.gd").new()

var scientist_total = 0
var scientist_occupied = 0

const SCIENTIST_START_PRICE : float = 1
var scientist_price_factor : float = 1.2
var scientist_price = SCIENTIST_START_PRICE
var scientist_pollution_travel = 50
var scientist_pollution_per_second = 5:
	set (value):
		if value < 2: 
			scientist_pollution_per_second = 2
		else:
			scientist_pollution_per_second = value

func enroll_scientist() -> Scientist :
	scientist_total += 1
	return scientist_factory.make_scientist()
	
func assign_scientist() :
	scientist_occupied += 1
	
func deassign_scientist() :
	scientist_occupied -= 1

func enough_scientist_for_assignement(n_scientist : int) -> bool :
	return n_scientist <= (scientist_total - scientist_occupied) 
	
func get_scientist_total() -> int :
	return scientist_total
	
func get_scientist_occupied() -> int :
	return scientist_occupied
	
func get_scientist_non_occupied() -> int:
	return scientist_total - scientist_occupied

func get_scientist_price() -> float:
	return scientist_price

func get_scientist_pollution_travel() -> int:
	return scientist_pollution_travel

func get_scientist_pollution_per_second() -> int:
	return scientist_pollution_per_second
	
func change_scientist_pollution_per_second(x: int) -> void:
	scientist_pollution_per_second += x
	
func change_scientist_pollution_traver(x: int) -> void:
	scientist_pollution_travel += x
	
func increase_price()->void:
	scientist_price = scientist_price * scientist_price_factor
	if scientist_price > 10000:
		scientist_price_factor = 1.0
	elif scientist_price > 1000:
		scientist_price_factor = 1.1
