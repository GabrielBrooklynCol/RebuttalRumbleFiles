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
			$Collider_Textbox.add_text("A hundred years have passed since the zombie outbreak ravaged civilization. Only one survivor of the outbreak remains: No one. Everyone who wasn’t a zombie is a zombie. Or just dead. “Living” life as a reanimated corpse with an unsatisfied craving for human flesh can bore you. That was when Goulstein saw their nostalgia as an opportunity. He specialized in making movies about zombies surviving the human apocalypse.  The zombies would bravely chase the terrifying and cowering humans and dine on their flesh. Of course, since humans are extinct, the humans in his movies are just zombies with rubber masks of human faces. Critics and the public loved his movies. Watching a constant stream of human outbreak movies was something the people could not get enough of. That was, until the people got enough. In recent years, less and less people came to watch his movies. His film crew were complaining about how tedious producing each film has been. His ego was blocking out their voices. The waning attention and rigid direction culminated in all three of his Zombie Bite movies to receive almost non existent attention. People would rather just be bored by themselves. ")
			#Adds proposition to inventory
			PlayerInventory.add_item("Proposition3", 1)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Collider_Textbox.completed == true:
					$Collider_Textbox.hide_textbox()
					get_tree().change_scene("res://Level_2Section2.tscn")
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
