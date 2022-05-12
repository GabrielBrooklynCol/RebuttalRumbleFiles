extends Node2D



func _on_MainMenu_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://DialogStage2.tscn")



func _on_Quit_pressed():
	get_tree().quit()
