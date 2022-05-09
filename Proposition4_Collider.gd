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
			$Collider_Textbox.add_text("During the Global Ghoul awards, Ghoulstein’s third Zombie Bite movie won all categories. All categories, except best picture. That award was snubbed by Alien James Lapid, the one Martian resident living in our world (The future of the zombie apocalypse brings interesting residents.) He was responsible for making Deadtective, a detective movie with the plot twist that there wasn’t a killer since everyone was technically dead. People didn’t like the movie for its plot twist. Instead, they were impressed that it was a movie that deviated from the horror movies people were subjected to by Goulstein. We as his crew thought this would be  his wake up call. However, things change when he and the rest of us encounter an actual human. This girl said her name was Allison but Goulstein saw her as a ticket to a comeback. He got the cast to put her in a cage with the intention of starring her in his latest film: Zombie Dinner. It’s the typical movie that we’ve been making but with the selling point being that a live human will be actually devoured. A rare delicacy would be great, but it’s ultimately going to involve us making a movie that’s similar to what he’s already made. Even if this gets tickets selling, this won’t change that his creativity is as lively as his audience.")
			#Adds proposition to inventory
			PlayerInventory.add_item("Proposition4", 1)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Collider_Textbox.completed == true:
					$Collider_Textbox.hide_textbox()
					get_tree().change_scene("res://Level_2Section3.tscn")
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
