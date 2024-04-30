extends Area2D

var trophy_triggered: bool = false

@onready var game_manager = %GameManager
@onready var trophy_audio = %Audio/Trophy

func _on_body_entered(body):
	if(body.name == "main_character" && game_manager.win_condition() && !trophy_triggered):
		trophy_triggered = true
		$Sprite2D.hide()
		trophy_audio.play()
		await trophy_audio.finished
		game_manager.change_scene()
