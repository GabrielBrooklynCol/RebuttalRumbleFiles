extends CanvasLayer
var dialogLevel = 1
var PressingOptions = 0
#var nodey = print(get_node("ResponseFellOffBike/Panel/MarginContainer/RichTextLabel/ResponseFOBBTN"))
#This will allow us to produce different dialogue depending on the level.
#Since we're starting off with the first dialogue, pressing the contradicting statement will lead to the response container 
#to be filled with the statement that was on the button the player pressed. This leads to the enemy to then respond to it. 
#The dialogLevel will increase. The enemy dialogue will reflect the next level and the buttons will reflect that enemy dialouge.
#It will keeps going untill we reach the last dialogue. Time: 11:42PM 3-8-22  
export(String,FILE,"*.json") var dialogue1 

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


#..............sy............
#export  (int) var health = 3
#
## Called when the node enters the scene tree for the first time.
#func _ready():
#	Global.player = self
#
#func _exit_tree():
#	Global.player = null

#.........sy...............


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_argueBTN_pressed():
	if (dialogLevel == 1):
		$DialogOptionsContainer.visible = true
	if (dialogLevel == 2):
		$SecondArgument.visible = true
	if (dialogLevel == 3):
		$ThirdArgument.visible = true
	if PressingOptions == 1: 
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/NotWantBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/OldSelfBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/KnewOfLoveBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/FallInLoveBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/LoveAsMuchBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/MadeYouHappyBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/TriedGetWayBTN").visible =false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/ShowerGiftsBTN").visible = true


#DialogOptionsContainer 1 -- Begin
func _on_MostFearedBTN_pressed(): #Wrong
	#$DialogOptionsContainer.visible = false
	#get_node("Response/Panel/MarginContainer/RichTextLabel").page = 
	$ResponseMostFeared.visible = true
	
	#..............sy.............
	#playerHealth()
	#..............sy..............
	
func _on_ResponseMostFearedBTN_pressed(): #This button will be on the Response textbox, open after the last dialogue.

	$ResponseMostFeared.visible = false #At the end of the textbox this button 
	#will be pressed and will turn off the response's visibility to show the ArgueOrProposition box.
	#$DialogOptionsContainer.visible = false
	get_node("ResponseMostFeared/Panel/MarginContainer/RichTextLabel/ResponseMostFearedBTN").visible = false #In case the player picks this button again, the dialogue will repeat. 
	#This will turn off the response button visibility and have the text appear again.
	#get_node("Response/Panel/MarginContainer/RichTextLabel").page = -2

func _on_T2TBTN_pressed(): #Wrong Statement
	$ResponseT2T.visible = true
	pass # Replace with function body.
	
	#..............sy.............
	#playerHealth()
	#..............sy..............
	

func _on_ResponseT2TBTN_pressed():
	$ResponseT2T.visible = false
	get_node("ResponseT2T/Panel/MarginContainer/RichTextLabel/ResponseT2TBTN").visible = false 
	pass # Replace with function body.

func _on_MonsterBTN_pressed(): #Wrong Statement
	$ResponseMonster.visible = true
	pass # Replace with function body.

	#..............sy.............
	#playerHealth()
	#..............sy..............
	
func _on_ResponseMonsterBTN_pressed():
	$ResponseMonster.visible = false
	get_node("ResponseT2T/Panel/MarginContainer/RichTextLabel/ResponseT2TBTN").visible = false 
	#get_node("Response/Panel/MarginContainer/RichTextLabel").page = -2
	#get_node("Response/Panel/MarginContainer/RichTextLabel").dialog[0] = ["Maybe"]

	#get_node("Response/Panel/MarginContainer/RichTextLabel").dialog = ["Maybe","What do you mean by that?","I mean maybe","You mean wrong.",""]

	#$ResponseMaybe.visible = true
	pass # Replace with function body.
	
func _on_FamilyBTN_pressed():
	
	$ResponseFamily.visible = true

func _on_ResponseFamilyBTN_pressed():
	$ResponseFamily.visible =  false
	$DialogOptionsContainer.visible = false
	dialogLevel = 2
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "Cat and I are the most romantic couple the Badhlands had ever seen. She’s not much of a talker, but that’s because she knew his Zerky would say what she wanted to say. The thing we had in common the most was how much we loved each other…"
	$ArgueOrProposition.visible = true
	
	
	
#Argument 1 -- END


#Argument 2

func _on_NotWantBTN_pressed():
	$ResponseNotWant.visible = true
	
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseNotWantBTN_pressed():
	$ResponseNotWant.visible = false
	get_node("ResponseNotWant/Panel/MarginContainer/RichTextLabel/ResponseNotWantBTN").visible = false
	pass # Replace with function body.

func _on_KnewOfLoveBTN_pressed():
	$ResponseKnewOfLove.visible = true

func _on_ResponseKOLBTN_pressed():
	$ResponseKnewOfLove.visible = false
	$SecondArgument.visible = false
	dialogLevel = 3
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My gang left me because they don’t see me as their leader. I’m not one of them anymore. They went on their own because they don’t want me to do with none of their achievements. I’m no longer a Pincer in their eyes. That don’t matter.  I’m going my own way. Zerksees will make his own path with his lovely Cat!"
	$ArgueOrProposition.visible = true

func _on_LoveAsMuchBTN_pressed():
	$ResponseLoveAsMuch.visible = true
	
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseLAMBTN_pressed():
	$ResponseLoveAsMuch.visible = false
	get_node("ResponseLoveAsMuch/Panel/MarginContainer/RichTextLabel/ResponseLAMBTN").visible = false
	pass # Replace with function body.

func _on_TriedGetWayBTN_pressed():
	$ResponseTriedGetWay.visible = true

func _on_ResponseTGWBTN_pressed():
	$ResponseTriedGetWay.visible = false
	$SecondArgument.visible = false
	PressingOptions = 1
	$ArgueOrProposition.visible = true
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My own gang would always try to get close to my Cat! They’d do anything to talk to her as if I didn’t notice. It’s obvious that they wanted to ruin the love between the both of us. I had threatened to kick them out or made them work in the Smooch and Kiss. Why would did they treat me like they did?"
	pass # Replace with function body.
# Pressing argument for Argument 2 --- Begin
func _on_FallInLoveBTN_pressed():
	$ResponseFallInLove.visible = true
	
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseFILBTN_pressed():
	$ResponseFallInLove.visible = false
	get_node("ResponseFallInLove/Panel/MarginContainer/RichTextLabel/ResponseFILBTN").visible = false

func _on_OldSelfBTN_pressed():
	$ResponseOldSelf.visible = true
	#..............sy.............
	#playerHealth()
	#..............sy..............
	
func _on_ResponseOldSelfBTN_pressed():
	$ResponseOldSelf.visible = false
	get_node("ResponseOldSelf/Panel/MarginContainer/RichTextLabel/ResponseOldSelfBTN").visible = false

func _on_ShowerGiftsBTN_pressed():
	$ResponseShowerGifts.visible = true
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseSGBTN_pressed():
	$ResponseShowerGifts.visible = false
	get_node("ResponseShowerGifts/Panel/MarginContainer/RichTextLabel/ResponseSGBTN").visible = false
	
func _on_MadeYouHappyBTN_pressed():
	$ResponseMadeYouHappy.visible = true

func _on_ResponseMYHBTN_pressed():
	$ResponseMadeYouHappy.visible = false
	$SecondArgument.visible = false
	dialogLevel = 3
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My gang left me because they don’t see me as their leader. I’m not one of them anymore. They went on their own because they don’t want me to do with none of their achievements. I’m no longer a Pincer in their eyes. That don’t matter.  I’m going my own way. Zerksees will make his own path with his lovely Cat!"
	$ArgueOrProposition.visible = true
#Pressing Argument for Argument 2 -- End




#func _on_MadeYouHappyBTN_presssed():
	#$ResponseMadeYouHappy.visible = true
	
#func _on_ResponseMYHBTN_pressed():
	
	#$ResponseMadeYouHappy.visible = false

#Argument 3 --Begin
func _on_PincerBTN_pressed():
	get_node("ResponsePincer/Panel/MarginContainer/RichTextLabel").page = -1
	$ResponsePincer.visible = true
	
		
func _on_ResponsePincerBTN_pressed():
	$ResponsePincer.visible =  false
	$ArgueOrProposition.visible = false
	$SecondArgument.visible = false
	$ThirdArgument.visible = false
	$ArgueOrProposition.visible = false

func _on_OrphanTrickedBTN_pressed():
	#get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel").page = -1
	$ResponseOrphanTricked.visible = true
	#get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel/ResponseOTBTN").visible = false

	#..............sy.............
	#playerHealth()
	#..............sy..............
	
func _on_ResponseOTBTN_pressed():
	$ResponseOrphanTricked.visible = false
	get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel").page = -1
	
	

func _on_FellOffBikeBTN_pressed():
	
	get_node("ResponseFellOffBike/Panel/MarginContainer/RichTextLabel").page = -1
	$ResponseFellOffBike.visible = true
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseFOBBTN_pressed():

	$ResponseFellOffBike.visible = false
	
	#get_node("ResponseFellOffBike/Panel/MarginContainer/RichTextLabel/ResponseFOBBTN").visible = false
	


func _on_CatGangBTN_pressed():
	
	get_node("ResponseCatGang/Panel/MarginContainer/RichTextLabel").page = -1
	$ResponseCatGang.visible = true
	
	#..............sy.............
	#playerHealth()
	#..............sy..............


func _on_ResponseCGBTN_pressed():
	#get_node("ResponseFellOffBike/Panel/MarginContainer/RichTextLabel").page = -2
	#get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel").page = -2
	#get_node("ResponsePincer/Panel/MarginContainer/RichTextLabel").page = -2
	$ResponseCatGang.visible = false
	

	
#Aegument 3 -- end


#.................sy................
#func playerHealth():
#	health -= 1
#	print("you lose a lift")
#	if health <= 0:
#		print("no more life")
#
#..............sy..........


func _on_Prop1Btn_pressed():
	$PropositionBox.visible = true
	$CloseBTN.visible = true
	$PropositionBox/MarginContainer/HBoxContainer/PropositionText.text = "A hundred years have passed since the zombie outbreak ravaged civilization. Only one survivor of the outbreak remains: No one. Everyone who wasn’t a zombie is a zombie. Or just dead. “Living” life as a reanimated corpse with an unsatisfied craving for human flesh can bore you. That was when Goulstein saw their nostalgia as an opportunity. He specialized in making movies about zombies surviving the human apocalypse.  The zombies would bravely chase the terrifying and cowering humans and dine on their flesh. Of course, since humans are extinct, the humans in his movies are just zombies with rubber masks of human faces. Critics and the public loved his movies. Watching a constant stream of human outbreak movies was something the people could not get enough of.\n\nThat was, until the people got enough. In recent years, less and less people came to watch his movies. His film crew were complaining about how tedious producing each film has been. His ego was blocking out their voices. The waning attention and rigid direction culminated in all three of his Zombie Bite movies to receive almost non existent attention. People would rather just be bored by themselves."
	pass # Replace with function body.

func _on_Prop2Btn_pressed():
	$PropositionBox.visible = true
	$CloseBTN.visible = true
	$PropositionBox/MarginContainer/HBoxContainer/PropositionText.text = "During the Global Ghoul awards, Ghoulstein’s third Zombie Bite movie won all categories. All categories, except best picture. That award was snubbed by Alien James Lapid, the one Martian resident living in our world (The future of the zombie apocalypse brings interesting residents.) He was responsible for making Deadtective, a detective movie with the plot twist that there wasn’t a killer since everyone was technically dead. People didn’t like the movie for its plot twist. Instead, they were impressed that it was a movie that deviated from the horror movies people were subjected to by Goulstein. We as his crew thought this would be  his wake up call."
	
	pass # Replace with function body.



func _on_CloseBTN_pressed():
	$PropositionBox.visible = false
	$CloseBTN.visible = false
	pass # Replace with function body.


