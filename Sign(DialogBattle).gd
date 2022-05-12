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
		$Info_Textbox.add_text("Uh oh! You're about to be face to face with the stage's captor! Naomi must rescue her friend the only way she knows how: Through contradicting her enemy's statements in a Dialog Battle! \n The enemy will give an argument and Naomi will have a choice of four dialog options in response to said options. The choices fall within one of three types: \n \n Contradicting Statement: Statements/Questions that contradicts the enemy's statement \n Pressing Statement: Statements/Questions that will provide a more detailed version of the enemy's argument, making the contradiction more apparent. \n Incorrect Statement: A statement completely unrelated to the argument and fails to contradict the enemy's statement, which results in losing a health point. \n \n  The propositions Naomi collected are key to figuring out which statement contradict's the  enemy's argument. Each propositions are readily available to view with the push of the Proposition 1 and Proposition 2 buttons, respectively. Carefully analyze which statement is inconsistent with the information presented by the propositions. Choose your statement wisely! You only have three health points and losing all of them will result in a game over. Best of luck, and have a fun debate!")

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
