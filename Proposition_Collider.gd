extends StaticBody2D

#Proposition Collider
var alreadyInteracted = false
var inBody = false
var textboxClicked = false
var fromCollider = false

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
			$Collider_Textbox.add_text("Example Proposition Info")
			#Adds proposition to inventory
			PlayerInventory.add_item("Proposition", 1)
			fromCollider = true
			#Change to the combat scene
			#Wait till the textbox is completed
	else:
		$ZBoxSprite.hide()
		

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Collider_Textbox.completed == true:
					$Collider_Textbox.hide_textbox()
					get_tree().change_scene("res://Level1_Section2.tscn")
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
