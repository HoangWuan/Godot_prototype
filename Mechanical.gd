extends Node
var time: int
var best_time: int = 0

func best_time_check() -> void:
	if(time < best_time):
		best_time = time
	elif(best_time == 0):
		best_time = time
	else:
		pass

func format_time(time: int) -> String:
	var total_second = time / 1000
	var minutes = total_second / 60
	var seconds = total_second % 60
	var mili = time % 1000
	var hhmmss_string:String = "%02d:%02d:%02d" % [minutes, seconds, mili]
	return hhmmss_string
	pass

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
