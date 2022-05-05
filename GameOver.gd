extends Node2D



func _on_MainMenu_pressed():
	get_tree().change_scene("res://TitleScreen.tscn")



func _on_Quit_pressed():
	get_tree().quit()
