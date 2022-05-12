extends StaticBody2D

#Proposition Collider
var alreadyInteracted = false
var inBody = false
var textboxClicked = false
export(String, MULTILINE) var text

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
	elif inBody == false:
		$ZBoxSprite.hide()
	if Input.is_action_pressed("ui_interact") && inBody:
		#Textbox pops up containing boss information
		$Info_Textbox.add_text("The item in front of you is a proposition. Propositions provide insight to not only the worlds the player is in but also information about the captor. \n  This will be an important resource so be sure to look back on it if needed. \n After interacting with the propsition it will be added to the player's inventory for you to view it again. Closing the proposition you first encounter will transition you to the next level.")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Info_Textbox.completed == true:
					$Info_Textbox.hide_textbox()
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
