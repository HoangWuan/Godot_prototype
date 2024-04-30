extends Node


func save_game():
	var file = FileAccess.open("user://savegame.data", FileAccess.WRITE)
	file.store_var(Mechanical.best_time)
	file.close()
	
func load_game():
	var file = FileAccess.open("user://savegame.data", FileAccess.READ)
	if(file != null):
		var best_time = file.get_var()
		if(best_time):
			Mechanical.best_time = best_time
		file.close()
	else:
		pass
	
	
