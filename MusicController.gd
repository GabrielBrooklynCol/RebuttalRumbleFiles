extends Node

var platform_music = load("res://Sounds/Arcade-Adventures_1.ogg")

func _ready():
	pass

func play_music():
	$Music.stream = platform_music
	$Music.play()
