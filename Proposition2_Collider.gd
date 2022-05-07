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
			$Collider_Textbox.add_text("During a friendly pillage session in a distant village, Zerksees found himself a lady. He called her Cat because she looked as cut as one she would always run to the corner whenever he was close to her like one. Ever since they met, he acted like a completely different person. He would often give her gifts such as bear plushies but they were often thrown around or torn apart. Since I, Ryder ofBooks, was the only one capable of writing in the gang, he made me transcribe his love letter. As always, she didn’t respond to what she said. In fact, she’d be more inclined to talk to anyone else besides him. This would upset Zirksees, and if he were to catch anyone talking to her or even make eye contact he’d get into a fight with them. The worse possible thing to come out of his obsession was his response to the loss of one of our mates. After our beloved member FelloffDaBike anDied passed away from a cold, we thought Zerksees would think of a way to honor his death. What we got after his passing, instead, was our Saloon’s name changed from The Stab and Kill to The Smooch and Kiss. He also had the place decorated with paper hearts and streamers and had the bartender dressed up like those babies with wings, diaper and everything! He was still obsessed with trying to impress his girl even after one of our own is not with us. After seeing what he’s done with the saloon, it seems FelloffDaBike was the lucky one. At that point, we knew that Zerksees was also gone. We haven’t had a good raid in forever, and we depend on those! I and the rest of us are off tomorrow. We’ll just leave the both of them on their own. From one Pincer to another.")
			#Adds proposition to inventory
			PlayerInventory.add_item("Proposition2", 1)

func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT && event.pressed:
				if $Collider_Textbox.completed == true:
					$Collider_Textbox.hide_textbox()
					get_tree().change_scene("res://Level_1Section3.tscn")
					textboxClicked = true

func _on_ZBox_body_entered(body):
	if "Player" in body.name:
		inBody = true

func _on_ZBox_body_exited(body):
	if "Player" in body.name:
		inBody = false
