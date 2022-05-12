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
			#Textbox pops up containing boss information
			$Info_Textbox.add_text("So, another pipsqueak shows up. Unfortunately for you, I already have someone on board rearin' to be a killing machine. Unless, are you trying to keep him for yourself? You should know what's mine is mine. Your life will be no exception. But, you're desperation is too funny to pass. Enter my lair so me and my lacky can hear that desperation together...")

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Info_Textbox.completed == true:
					$Info_Textbox.hide_textbox()
					get_tree().change_scene("res://DialogStage1(Re-Work).tscn")
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
		$ZBoxSprite.hide()
