extends Control


func _on_restart_pressed():
	get_tree().paused = false
	Global.reset()
	get_tree().change_scene_to_file("res://Levels/Level1.tscn")


func _on_quit_pressed():
	get_tree().quit()
