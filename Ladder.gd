extends Area2D



func _on_Ladder_body_entered(body):
	if "Player" in body.name:
		if body.climbing == false:
			body.climbing = true
		


func _on_Ladder_body_exited(body):
	if "Player" in body.name:
		if body.climbing == true:
			body.climbing = false


