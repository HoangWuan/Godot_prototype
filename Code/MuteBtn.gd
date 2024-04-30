extends TextureButton

func _on_toggled(toggled_on):
	if(toggled_on):
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), true)
	else:
		AudioServer.set_bus_mute(AudioServer.get_bus_index("Master"), false)
