extends CharacterBody2D
class_name Scientist

@onready var navigation_agent: NavigationAgent2D = $NavigationAgent2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer

@export var speed := 3000

var hours_in_same_building := 0
var can_change_target = true
var current_animation := "up_walk"

func _ready() -> void:
	UiController.new_hour.connect(_on_new_hour)
	navigation_agent.target_position = Vector2(0,0)
	
func _physics_process(delta: float) -> void:
	if navigation_agent.is_target_reachable() :
		var new_point_direction = to_local(navigation_agent.get_next_path_position()).normalized()
		velocity = new_point_direction * speed * delta
		move_and_slide()
		play_animation()
	else :
		change_target()
		
func play_animation():
	var normal_velocity := velocity.normalized()
	if normal_velocity.y < -0.9:
		current_animation = "up_walk"
	elif normal_velocity.y > 0.9:
		current_animation = "down_walk"
	elif normal_velocity.x < -0.9:
		current_animation = "left_walk"
	elif normal_velocity.x > 0.9:
		current_animation = "right_walk"
		
	animation_player.play(current_animation)

func _on_new_hour(hour):
	hours_in_same_building += 1
	if want_to_change():
		change_target()

func want_to_change() -> bool:
	var i = randi_range(0,10)
	return ( i < hours_in_same_building ) && can_change_target

func _on_navigation_agent_2d_navigation_finished() -> void:
	visible = false
	can_change_target = true

func change_target():
	var new_position = get_random_building_position()
	if new_position.distance_to(navigation_agent.target_position) > 10 :
		navigation_agent.target_position = new_position
		hours_in_same_building = 0
		visible = true
		can_change_target = false

func get_random_building_position() -> Vector2:
	return GameController.get_random_building_position()
