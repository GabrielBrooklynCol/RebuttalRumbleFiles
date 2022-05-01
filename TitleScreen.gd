extends Node


func _on_PlayBtn_pressed():
	get_tree().change_scene("res://Level_1.tscn")
	
	


func _on_ExitBtn_pressed():
	get_tree().quit()
