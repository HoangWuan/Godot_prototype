extends Node


var point = 0
var collectable_num : int
var not_pause: bool = true

@onready var start_time: int = Time.get_ticks_msec()
@onready var last_time: int = Mechanical.time
@onready var label_point: Label = %UI/Panel/Point
@onready var label_left: Label = %UI/Panel/Left
@onready var label_time: Label = %UI/Panel/Time
@export var target_level : String
@export var collectable_group : Node

func _on_ready():
	collectable_num = collectable_group.get_child_count()
	
func _process(delta):

	label_left.text = "LEFT: " + str(left_point())
	label_time.text = "TIME: " + Mechanical.format_time(get_time_playing())
	pass

func _input(event):
	if(Input.is_action_just_pressed("reset")):
		get_tree().reload_current_scene()
		
func _exit_tree() -> void:
	Mechanical.time = get_time_playing()
	if(target_level == "res://Scene/main_menu.tscn" && not_pause):
		Mechanical.best_time_check()
		Mechanical.time = 0
		Save.save_game()


		
func get_time_playing() -> int:
	return (last_time + Time.get_ticks_msec() - start_time)

func left_point() -> int:
	return collectable_num - point 

func win_condition() -> bool:
	return collectable_num == point

func add_point():
	point += 1
	label_point.text = "POINT: " + str(point)

func change_scene():
	SceneManager.switch_scene(target_level)

