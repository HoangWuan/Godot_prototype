extends Area2D

@onready var game_manager = %GameManager
@onready var collect_audio = %Audio/Collect

func _on_body_entered(body):
	if(body.name == "main_character"):
		collect_audio.play()
		queue_free()
		game_manager.add_point()
