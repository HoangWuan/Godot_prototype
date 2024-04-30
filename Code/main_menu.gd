extends Node


@onready var best_time = $"Best Time"

func _on_ready():
	Save.load_game()
	Mechanical.time = 0
	best_time.text = "BEST TIME: " + Mechanical.format_time(Mechanical.best_time)
	
func _on_btn_1_pressed():
	SceneManager.switch_scene("res://Scene/Level 1.tscn")

