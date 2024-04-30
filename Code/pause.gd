extends CanvasLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	pass # Replace with function body.

func _input(event):
		if(Input.is_action_just_pressed("pause")):
			if(get_tree().paused):
				get_tree().paused = false
				hide()
			else:
				get_tree().paused = true
				show()
		

func _on_resume_pressed():
	get_tree().paused = false
	hide()

func _on_back_pressed():
	get_tree().paused = false
	%GameManager.not_pause = false
	SceneManager.switch_scene("res://Scene/main_menu.tscn")

func _on_exit_pressed():
	get_tree().quit()
