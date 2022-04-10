extends StaticBody2D

#Proposition Collider
var alreadyInteracted = false
var inBody = false
var textboxClicked = false

# Start by hiding the info (Z button) box
func _ready():
	$ZBoxSprite.hide()


# While the player is near the collider (and hasn't interacted with it already),
# a "Z" prompt will hover over the collider
# Once the player has pressed Z, a textbox will play that'll pause the game
# Until it's done.
func _physics_process(delta):
	if inBody == true:
		$ZBoxSprite.show()
		if Input.is_action_pressed("ui_interact"):
			#Textbox pops up containing proposition information
			$Collider_Textbox.add_text("In the scorching heat of the Badhlands, there’s no other gang you’ll see ruling over its sands than the fierce Pincer! We ride on our hogs and cause a living heck to those who are in our way and those dumb enough to get in our way. Whenever a gang has a problem with us, we show them how we’re actually top-of-the-line plastic surgeons! They come to us with their heads, then they leave without one! Anything you can think of, killing, stealing, harsh language, our gang has done it as one. And that was thanks to our leader, Zerksees. None of us could have faced the lands on our own, but he managed to cobble together lonely bikers, orphaned children, and children he made into orphans and formed into something we’ve called our family.")
			#Adds proposition to inventory
			PlayerInventory.add_item("Proposition", 1)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Collider_Textbox.completed == true:
					$Collider_Textbox.hide_textbox()
					get_tree().change_scene("res://Level_1Section2.tscn")
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
