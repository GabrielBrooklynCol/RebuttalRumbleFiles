extends CanvasLayer
var dialogLevel = 1
var PressingOptions = 0
var dialogPage = 0
var dialogCategory 
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
export  (int) var health = 3

# Called when the node enters the scene tree for the first time.
func _ready():
	Global.player = self
	$AudioStreamPlayer.play()
	
func _exit_tree():
	Global.player = null

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
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer/AcclaimedBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/OldSelfBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/KnewOfLoveBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/FallInLoveBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/LoveAsMuchBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/MadeYouHappyBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/TriedGetWayBTN").visible =false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/ShowerGiftsBTN").visible = true


#DialogOptionsContainer 1 -- Begin
func _on_AcclaimedBTN_pressed(): #Wrong
	#$DialogOptionsContainer.visible = false
	#get_node("Response/Panel/MarginContainer/RichTextLabel").page = 
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "All your movies had that level of acclaim?"
	dialogCategory = "Acclaimed"
	#.............sy..........
	hideEnemyDialogueBox()
	#.............sy..........
	#not sure should the player lose a point when they press the pressing button
	#..............sy.............
	#playerHealth()
	#..............sy..............
	
func _on_ResponseMostFearedBTN_pressed(): #Response to Acclaimed
	
	#$DialogOptionsContainer.visible = false
	#$ArgueOrProposition.visible = true
	##PressingOptions = 1
	
	# Argument 1 -- BEGIN
	if dialogPage == 0 && dialogCategory == "Acclaimed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Of course they have! Since when has a director ever been dishonest? Want more proof? Look at how the public idolizes me."
		
		
	if dialogPage == 1 && dialogCategory == "Acclaimed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Why, take my latest works , for example. They show the elegant and masterful relationship between man and reanimated man."
		
	if dialogPage == 2 && dialogCategory == "Acclaimed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Then they must be really good! We should all watch those movies."
		
	if dialogPage == 3 && dialogCategory == "Acclaimed" :
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "O-or, you can tell us more about your recent films." 
	if dialogPage == 4 && dialogCategory == "Acclaimed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Y-yeah! Let's have some insight into what goes on in your mind."
	
	if dialogPage == 5 && dialogCategory == "Acclaimed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Well, you'll quickly realize it's nothing but brilliance! And also maggots."
		
	
	if dialogPage == 6 && dialogCategory == "Acclaimed":
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer/AcclaimedBTN").visible = false
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer/1stMovie").visible = true
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer/T2TBTN").visible = false
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer/2ndMovie").visible = true
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer2/MonsterBTN").visible = false
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer2/3rdMovie").visible = true
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer2/FamilyBTN").visible =false
		get_node("DialogOptionsContainer/Panel/MarginContainer/Panel/HBoxContainer2/AllMovies").visible = true
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "All my newer films are just to un-die for! From Zombies Bite, to Zombies Bite Again to Zombies Doing the Second Thing The Third Time, the audience just can’t get enough of them. I can’t even fathom a single film the audience doesn’t love!"
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		
		
	dialogPage += 1
	print(dialogPage)
	
	#Pressing Argument Responses for Argument 1 -- Begin
	if dialogPage == 1 && dialogCategory == "firstMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "My first film may not be as perfect but it's still perfect!"
	
	if dialogPage == 2 && dialogCategory == "firstMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If anything, that means my crew was too soft. A good actor needs a good yelling to." 
		
	if dialogPage == 3 && dialogCategory == "firstMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "But, wouldn't you get the best out of your movie if you treat them with respect?"
		
	if dialogPage == 4 && dialogCategory == "firstMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That kind of advice puts you in a cage. And so will your friends after they spout ignorant opinions."
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............
		
	if dialogPage == 1 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That movie was even better! It had a diversed cast of humans..."

	if dialogPage == 2 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Well, that's definitely--"
		
	if dialogPage == 3 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "...that all got devoured after the first 20 seconds."
	
	if dialogPage == 4 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "...dissapointing."
	
	if dialogPage == 5 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Well, that's 20 seconds longer compared to our world's horror movies so I'd call that an accomplishment too."
	
	if dialogPage == 6 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You can't spell 'diversed' without 'died' "
	
	if dialogPage == 7 && dialogCategory == "secondMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "And I can't work with ignorant children and their ignorant opinions!"
		#$ResponseAcclaimed.visible = false
		#$NameTag.visible = false
		#$DialogOptionsContainer.visible = true
		#print(dialogCategory)
		
	if dialogPage == 8 && dialogCategory == "secondMovie":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............
		
	
	if dialogPage == 1 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That movie was the peak of the trilogy! A million zombies all in one screen."

	if dialogPage == 2 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "All those zombies at once? They must have really needed the money."
		
	if dialogPage == 3 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Nonsense. As soon as they hear I'm creating a movie, an endless supply of devotees desire to take part. Money never poses an issue here."
	
	if dialogPage == 4 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I wonder what currency this world operates with."
		
	if dialogPage == 5 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Well, considering the setting of this dimension, probably something dead but still shambles on to try to justify it's existence?"
	if dialogPage == 6 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "No, we use bitcoin"
	
	if dialogPage == 7 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Oh, so just a dead currency?"
	
	if dialogPage == 8 && dialogCategory == "thirdMovie":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Once all of you become dinner for my movie and I make my money during very specific and limited peaks, you'll know it's not dead!"
	
	if dialogPage == 9 && dialogCategory == "thirdMovie":
		
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............



	if dialogPage == 1 && dialogCategory == "allMovies":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "What gives you the audacity to say that?"

	if dialogPage == 2 && dialogCategory == "allMovies":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Very little people have watched the Zombie Bite movies, your most recent movies. It wasn't any movie in particular, that was how it was like for all three of your movies."
		
	if dialogPage == 3 && dialogCategory == "allMovies":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Well, that doesn't stop my movies from being the pinnacle of quality."
	
	if dialogPage == 4 && dialogCategory == "allMovies":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That runs counter to the fact that your movies were progressively getting less viewers."
		
	if dialogPage == 5 && dialogCategory == "allMovies":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That's just an oblivious mass! These are the same people who'd chomp on their own limbs before realizing it's theirs."
	
	if dialogPage == 6 && dialogCategory == "allMovies":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's a good thing my cast members knows better. Such stupidity would never run on their decrepit vains. I'm pleased to explain how."
		
	if dialogPage == 7 && dialogCategory == "allMovies":
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "Those spectators wouldn't know quality if it oozed from their orifice! Fortunately my cast members are supportive of my vision. They are so enthralled with my subtle nuances they can't help but exhale air out of their mouths slowly in excitement! Must be biting warm ups."
#Pressing Argument Responses for Argument 1 -- END
	
	if dialogPage == 1 && dialogCategory == "critics":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The critics can't get enough of what I produce? I put the \"darling\" in  \"critical darling\" " 

	if dialogPage == 2 && dialogCategory == "critics":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "What did they say about them?"
		
	if dialogPage == 3 && dialogCategory == "critics":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They were impressed that they were \"cinematographies that capture the vigor of reanimated cadavers\" "
	if dialogPage == 4 && dialogCategory == "critics":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It sounds like a lot of sharp vocabulary to say that it does the bare minimum of making a movie with zombies."
	
	if dialogPage == 5 && dialogCategory == "critics":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Goldstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I'll show you \"bare minimum\" once you two are part of the catering!"
	
	if dialogPage == 6 && dialogCategory == "critics":
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
	
	
	if dialogPage == 1 && dialogCategory == "creativity":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I practically invented zombie cinema. What reason would I have to make something different?" 

	if dialogPage == 2 && dialogCategory == "creativity":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It'll show the adaptability of your artistic skills?"
		
	if dialogPage == 3 && dialogCategory == "creativity":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The girl in the cage wil allow me to do that." 
	
	if dialogPage == 4 && dialogCategory == "creativity":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Maybe they'll like it more if this movie were a book, instead?"
	
	if dialogPage == 5 && dialogCategory == "creativity":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You can't film a book. How charming of you! Hope you show that charm before your last scene!"

	if dialogPage == 6 && dialogCategory == "creativity":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

		
 #Argument 2 -- Begin
	if dialogPage == 1 && dialogCategory == "castMembers":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I provide my crew opportunities to star in art. What would make you think that?"
		
	if dialogPage == 2 && dialogCategory == "castMembers":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Because your crew thinks that. They feel that the direction of your movies have been uninspired." 
	
	if dialogPage == 3 && dialogCategory == "castMembers":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Well, that's just because they speak from naivete. The moment I give them direction is the moment they're enlightened." 
	
	if dialogPage == 4  && dialogCategory == "castMembers":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Then why do they feel the need to give input that goes ignored?" 
	
	if dialogPage == 5 && dialogCategory == "castMembers":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Because they intrude with my creativity! Leave the musician to their music."
		
	if dialogPage == 6 && dialogCategory == "castMembers":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "My awards are a testament to this fact!"
	
	if dialogPage == 7 && dialogCategory == "castMembers":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "Even if they don’t understand, all they need to do is keep their decrepit lips shut and let my art do the talking! The films simply resonate with the audience by tapping into their desires. If they didn’t think so, then they would’ve bestowed my latest film with the ultimate sign of praise."
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
	if dialogPage == 1 && dialogCategory == "hatedWorking":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They never shown an once of hatred to being a part of my work!" 
		
	if dialogPage == 2 && dialogCategory == "hatedWorking":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You shouldn't speak of aspects of production you know nothing about." 
	
	if dialogPage == 2 && dialogCategory == "hatedWorking":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "We starred in a school PSA about bullying. Does that count?" 
	
	if dialogPage == 3 && dialogCategory == "hatedWorking":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Knowing her words, she clearly didn't take anything from it." 
	
	if dialogPage == 4 && dialogCategory == "hatedWorking":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............


	if dialogPage == 1 && dialogCategory == "deepDown":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You have no idea who you're speaking about. My films are calculated to meet a very specific quality to my liking."
		
	if dialogPage == 2 && dialogCategory == "deepDown":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Or does this stem from jealousy? No need to fret, your jealousy won't matter once the both of you are dined on!" 
	
	if dialogPage == 3 && dialogCategory == "deepDown":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Or does this stem from jealousy? No need to fret, your jealousy won't matter once the both of you are dined on!" 
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

		
	if dialogPage == 1 && dialogCategory == "vision":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Not in the slightest. They ask for talented direction, they get talented direction!"
		
	if dialogPage == 2 && dialogCategory == "vision":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They'll be happier once this movie comes to fruition!" 
	
	if dialogPage == 3 && dialogCategory == "vision":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	#Argument 2 -- END
	
	#Argument 3 -- BEGIN
	
	if dialogPage == 1 && dialogCategory == "rely":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's not a reliance it's an extension of my skills!"
	if dialogPage == 2 && dialogCategory == "rely":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "With the both of you in this movie, you just might extend my skills even further! " 
	
	if dialogPage == 3 && dialogCategory == "rely":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "ultimateSign":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "No doubt about that! The awards are meant to be given to the best."
	if dialogPage == 2 && dialogCategory == "ultimateSign":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Then whoever gave this must be quite important." 
	
	if dialogPage == 3 && dialogCategory == "ultimateSign":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's not from simply \"whoever\". It's from an award show that honors their festering filmmakers is almost as beautiful as me."
	if dialogPage == 4 && dialogCategory == "ultimateSign":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "What was this award show?"
	
	if dialogPage == 5 && dialogCategory == "ultimateSign":
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer/PincerBTN").visible = false
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer/FixedBTN").visible = true
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer/OrphanTrickedBTN").visible = false
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer/ThreeCategoriesBTN").visible = true
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer2/FellOffBikeBTN").visible = false
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer2/detectMovieBTN").visible = true
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer2/CatGangBTN").visible =false
		get_node("ThirdArgument/Panel/MarginContainer/Panel/HBoxContainer2/PressuredBTN").visible = true
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "The Golden Ghoul Awards! I easily took the best picture. I also took Best Disembowelment, Best Screaming and Best Screaming DURING Disembowelment! I really know how to bring life into the dead."
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
	#Pressing argument Responses for Argument 3 -- Begin
	if dialogPage == 1 && dialogCategory == "Fixed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Those were just rumors! Lies perputated to slander me and scare other actors from working with me!" 
	
	if dialogPage == 2 && dialogCategory == "Fixed":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You bringing them up is only going to perpetuate them even more!" 
	
	if dialogPage == 3 && dialogCategory == "Fixed":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "ThreeCategories":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The master of zombie cinema will never lose such easily achievable achievements!"
	
	if dialogPage == 2 && dialogCategory == "ThreeCategories":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You're ignorance to my talents disgust me."
	
	if dialogPage == 3 && dialogCategory == "ThreeCategories":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "Pressured":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Of course not! Such achievements is what pushes my creativity!"
	
	if dialogPage == 2 && dialogCategory == "Pressured":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Just think of the awards I'll get for making this movie! I could make Zombie Bite movies for centuries!"
	
	if dialogPage == 3 && dialogCategory == "Pressured":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That's a future I can't have you two ruin!"
		
	if dialogPage == 4 && dialogCategory == "Pressured":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............


#Pressing argument Responses for Argument 3 -- End
	if dialogPage == 1 && dialogCategory == "desires":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It may be decades since the last apocalypse, but they're hunger still remains."
		
	if dialogPage == 2 && dialogCategory == "desires":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's why I have to take advantage of an opportunity that's been given to me, and I won't let you two get in the way of that!"
	
	if dialogPage == 3 && dialogCategory == "desires":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

		
	if dialogPage == 1 && dialogCategory == "recievedPraise":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Are you referring to Deadtective? A forgettable movie that tried and failed to imitate my style!" 
		
	if dialogPage == 2 && dialogCategory == "recievedPraise":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If it won best picture, then there has to be something special about it."
	
	if dialogPage == 3 && dialogCategory == "recievedPraise":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Besides, I'm sure it can't be forgettable if it won best picture."
	if dialogPage == 3 && dialogCategory == "recievedPraise":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That movie was Golden Ghoul bait! A movie reliant on gimmicks to impress a bunch of no-brains!"
	
	if dialogPage == 4 && dialogCategory == "recievedPraise": 
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The movie must have been really bad for you to think that. How about you give us more of what you think?"
	
	if dialogPage == 5 && dialogCategory == "recievedPraise": 
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Ask and you shall recieve!"

	if dialogPage == 6 && dialogCategory == "recievedPraise":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "The Deadtective was just pretentious shlock! The audience didn’t have any idea what the movie was about nor what was going on. That’s because the director of that mistake isn’t capable of reading the audience like I can. The flicks I make have all the qualities that The Deadtective wishes it could achieve!"
		$FourthArgument.visible = true
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
		
	#Argument 3 -- END
	
	#Argument 4 -- begin
	if dialogPage == 1 && dialogCategory == "Scarier":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Now that I know is a lie. My movies are so scary they redefined the horror genre itself!"
	
	if dialogPage == 2 && dialogCategory == "Scarier":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Watch as I show you and my audience that I'm able to do so yet again with this film!"
	
	if dialogPage == 3 && dialogCategory == "Scarier":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FourthArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That's all it takes to fool the idiot masses!?"
	
	if dialogPage == 2 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's a matter of preference. What good will it be to get upset?"
	
	if dialogPage == 3 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = " The craft I make isn't limited by subjectivity! They are only the top of the line! Do they really not see perfection when it's in front of them!? "
		

	if dialogPage == 4 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I mean, I'm no director myself..."

	if dialogPage == 5 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "...but maybe this could be a wake up call to do more with your movies?"

	if dialogPage == 6 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "...Yeah, you're right. I shouldn't let this deter me."
	
	if dialogPage == 7 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Yeah, you shouldn't! You can bounce back from this!"
	
	if dialogPage == 8 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I'll bounce back by creating this movie!"
	
	if dialogPage == 9 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That wasn't what I had in mind."
	
	if dialogPage == 10 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It just sounds like you're intentionally misconstrewing her."
	
	if dialogPage == 11 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Why are you still hanging on to this movie?"
	
	if dialogPage == 12 && dialogCategory == "Happy":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The oblivious folk are still oblivious. With this newly found vigor, I'll have to fill you in one more time..."
	
	if dialogPage == 13 && dialogCategory == "Happy":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FifthArgument.visible = true
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "This is just an obstacle to overcome. A gifted director shunned by the public and peers alike. Their refusal to see my talent at play is a sign that the envelope must be pushed! Your friend showing up here is no coincidence; she’s the key to my film’s success. She’s what’s missing in my movies: an actual human! Once they know what’s starring in this movie, I’ll be placed in the upper echelons of zombie cinematography!"
		
	if dialogPage == 1 && dialogCategory == "Chase":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "What are you talking about? The Zombie Bite movies are filled with the most enthralling chase scenes."
	
	if dialogPage == 2 && dialogCategory == "Chase":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "From zombies chasing humans in a mall to to zombie chasing humans in a museum, I read what the audience desires the most. Don't demean an essential quality to my trilogy!"
	
	if dialogPage == 3 && dialogCategory == "Chase":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FourthArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "Characters":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The characters were the most compelling part! The screeches from the zombies are an essential part to their very being."
	
	if dialogPage == 2 && dialogCategory == "Characters":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "My greatest character writing will be on full display. That is, if you two nuisances are out of the picture!"
	
	if dialogPage == 3 && dialogCategory == "Characters":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FourthArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	#Argument 4 -- END
	
	
	#Argument 5 -- Begin
	if dialogPage == 1 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That's not true. The human is all I need for them to see my true potential."
	
	if dialogPage == 2 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "But the only reason people are going to watch the movie is because it has a human."
	
	if dialogPage == 3 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Then I'll have the I'll have you two in the two other movies!"
	
	if dialogPage == 4 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Isaiah"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Then what will happen if we're gone? You'll have to go back to making movies that hardly anyone watches "
	
	if dialogPage == 5 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "And that's if the audience won't get tired of the gimmick by the sequel."
	
	if dialogPage == 6 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Are you insisting I should just create the movie and that's that?"
	
	if dialogPage == 6 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You're better off not making another horror movie entirely. If people are only interested in seeing a human in a movie, then are they really interested in the movie itself?"
	
	if dialogPage == 7 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Hmm."
	
	if dialogPage == 9 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I suppose the audience desire something even more. Besides, I'm far above using marketing ploys for my film."
	
	if dialogPage == 10 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Fine, I won't be proceeding with this film. The perfect filmmaker will shine with his own skills!"
			
	if dialogPage == 11 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Though, I could use some more insight from your friend. Allison, will you like to help?"
		
	if dialogPage == 12 && dialogCategory == "Interested":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Sure thing! After you let me out of this cage, of course."
	
	if dialogPage == 13 && dialogCategory == "Interested":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FifthArgument.visible = false
		#............sy.........
		get_tree().change_scene("res://youWin.tscn")
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		#.............sy..........
	
	
	if dialogPage == 1 && dialogCategory == "Collab":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "A collaboration is what he's desperate for, not me."
	
	if dialogPage == 2 && dialogCategory == "Collab":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If you're so adamant to talk about an inferior director, then I don't want to waste my time with you!"
	
	if dialogPage == 3 && dialogCategory == "Collab":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FifthArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "Human":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "On the contrary, someone as inspirational as her is what makes her a perfect resource for my movie."
	
	if dialogPage == 2 && dialogCategory == "Human":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Allison"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Inspirational enough to not have me killed on set?"
	
	if dialogPage == 3 && dialogCategory == "Human":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "No."
	
	if dialogPage == 4 && dialogCategory == "Human":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FifthArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

		
	if dialogPage == 1 && dialogCategory == "Cast":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If I followed ideas from them, they'd just devour her without a second thought."
	
	if dialogPage == 2 && dialogCategory == "Cast":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Those people can't appreciate the art of timing. Like how you two don't appreciate art! "
	
	if dialogPage == 3 && dialogCategory == "Cast":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$FifthArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	
	
	#Argument 5 -- END
	
	
	
#PressingArgument -- Argument 1 -- Begin
func _on_1stMovie_pressed():
	dialogPage = 0
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The first movie"
	dialogCategory = "firstMovie"
	pass # Replace with function body.
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........

func _on_Response1stBTN_pressed():
	pass

func _on_2ndMovie_pressed():
	dialogPage = 0
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The second movie"
	dialogCategory = "secondMovie"
	pass
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........

func _on_Response2ndBTN_pressed():
	pass
	
func _on_3rdMovie_pressed():
	dialogPage = 0
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The third movie"
	dialogCategory = "thirdMovie"
	pass
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
func _on_Response3rdBTN_pressed():
	pass
	
func _on_AllMovies_pressed():
	dialogPage = 0
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "All those movies"
	dialogCategory = "allMovies"
	pass
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........

func _on_ResponseAllBTN_pressed():
	pass

#PressingArgument -- Argument 1 -- End

func _on_T2TBTN_pressed(): #Wrong Statement
	dialogPage = 0
	dialogCategory = "allMovies"
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Are people that excited about your more recent movies?"
	#$ResponseT2T.visible = true
	pass # Replace with function body.
	
	#..............sy.............
	#playerHealth()
	#..............sy..............
	

func _on_ResponseT2TBTN_pressed():
	$ResponseT2T.visible = false
	#get_node("ResponseT2T/Panel/ResponseT2TBTN").visible = false 
	

func _on_MonsterBTN_pressed(): #Wrong Statement
	dialogPage = 0
	dialogCategory = "critics"
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Weren’t the films receiving less attention because of its critics?"
	#$ResponseMonster.visible = true
	#.............sy..........
	#when the button is click, the enemy dialog box will be hidden
	$Enemy/EnemyDialogue.visible = false
	#.............sy..........
	
func _on_ResponseMonsterBTN_pressed():
	$ResponseMonster.visible = false
	#get_node("ResponseMonster/Panel/ResponseMonsterBTN").visible = false 
	#get_node("Response/Panel/MarginContainer/RichTextLabel").page = -2
	#get_node("Response/Panel/MarginContainer/RichTextLabel").dialog[0] = ["Maybe"]

	#get_node("Response/Panel/MarginContainer/RichTextLabel").dialog = ["Maybe","What do you mean by that?","I mean maybe","You mean wrong.",""]

	#$ResponseMaybe.visible = true
	
	
func _on_FamilyBTN_pressed():
	dialogPage = 0
	dialogCategory = "creativity"
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "There’s ways beyond movies you want to express your creativity"
	#$ResponseFamily.visible = true
	

func _on_ResponseFamilyBTN_pressed():
	$ResponseFamily.visible =  false
	$DialogOptionsContainer.visible = false
	dialogLevel = 2
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "Cat and I are the most romantic couple the Badhlands had ever seen. She’s not much of a talker, but that’s because she knew his Zerky would say what she wanted to say. The thing we had in common the most was how much we loved each other…"
	$ArgueOrProposition.visible = true
	
#Argument 1 -- END


#Argument 2

func _on_NotWantBTN_pressed():
	#$ResponseNotWant.visible = true
	dialogPage = 0
	dialogCategory = "castMembers"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Your cast members have complained about how bland the films have been."
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
	
func _on_ResponseNotWantBTN_pressed():
	$ResponseNotWant.visible = false
	get_node("ResponseNotWant/Panel/MarginContainer/RichTextLabel/ResponseNotWantBTN").visible = false
	pass # Replace with function body.

func _on_KnewOfLoveBTN_pressed():
	dialogPage = 0
	dialogCategory = "hatedWorking"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "All those movies"
	#$ResponseKnewOfLove.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
func _on_ResponseKOLBTN_pressed():
	$ResponseKnewOfLove.visible = false
	$SecondArgument.visible = false
	dialogLevel = 3
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My gang left me because they don’t see me as their leader. I’m not one of them anymore. They went on their own because they don’t want me to do with none of their achievements. I’m no longer a Pincer in their eyes. That don’t matter.  I’m going my own way. Zerksees will make his own path with his lovely Cat!"
	$ArgueOrProposition.visible = true

func _on_LoveAsMuchBTN_pressed():
	#$ResponseLoveAsMuch.visible = true
	dialogPage = 0
	dialogCategory = "deepDown"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Deep down, you feel that you’ve been losing interest in the direction of your films."
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseLAMBTN_pressed():
	$ResponseLoveAsMuch.visible = false
	get_node("ResponseLoveAsMuch/Panel/MarginContainer/RichTextLabel/ResponseLAMBTN").visible = false
	pass # Replace with function body.

func _on_TriedGetWayBTN_pressed():
	#$ResponseTriedGetWay.visible = true
	dialogPage = 0
	dialogCategory = "vision"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Haven’t you complained to your film crew about not following your vision?"

func _on_ResponseTGWBTN_pressed():
	$ResponseTriedGetWay.visible = false
	$SecondArgument.visible = false
	PressingOptions = 1
	$ArgueOrProposition.visible = true
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My own gang would always try to get close to my Cat! They’d do anything to talk to her as if I didn’t notice. It’s obvious that they wanted to ruin the love between the both of us. I had threatened to kick them out or made them work in the Smooch and Kiss. Why would did they treat me like they did?"
	 # Replace with function body.
	# Pressing argument for Argument 2 --- Begin
func _on_FallInLoveBTN_pressed():
	
	#..............sy.............
	#playerHealth()
	#..............sy..............
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........

func _on_ResponseFILBTN_pressed():
	$ResponseFallInLove.visible = false
	get_node("ResponseFallInLove/Panel/MarginContainer/RichTextLabel/ResponseFILBTN").visible = false

func _on_OldSelfBTN_pressed():
	
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
func _on_ResponseOldSelfBTN_pressed():
	$ResponseOldSelf.visible = false
	get_node("ResponseOldSelf/Panel/MarginContainer/RichTextLabel/ResponseOldSelfBTN").visible = false

func _on_ShowerGiftsBTN_pressed():
	$ResponseShowerGifts.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	

func _on_ResponseSGBTN_pressed():
	$ResponseShowerGifts.visible = false
	get_node("ResponseShowerGifts/Panel/MarginContainer/RichTextLabel/ResponseSGBTN").visible = false
	
func _on_MadeYouHappyBTN_pressed():
	$ResponseMadeYouHappy.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	

func _on_ResponseMYHBTN_pressed():
	$ArgueOrProposition.visible = true
#Pressing Argument for Argument 2 -- End




#func _on_MadeYouHappyBTN_presssed():
	#$ResponseMadeYouHappy.visible = true
	
#func _on_ResponseMYHBTN_pressed():
	
	#$ResponseMadeYouHappy.visible = false

#Argument 3 --Begin
func _on_PincerBTN_pressed():
	dialogPage = 0
	dialogCategory = "rely"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You said before that you don’t need to rely on actual humans to improve your movies."
	#$ResponsePincer.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
		
func _on_ResponsePincerBTN_pressed():
	$ResponsePincer.visible =  false
	$ArgueOrProposition.visible = false
	$SecondArgument.visible = false
	$ThirdArgument.visible = false
	$ArgueOrProposition.visible = false

func _on_OrphanTrickedBTN_pressed():
	dialogPage = 0
	dialogCategory = "ultimateSign"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That “ultimate sign of praise” must have played quite the influence"
	#$ResponseOrphanTricked.visible = true
	#get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel/ResponseOTBTN").visible = false
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	#..............sy.............
	#playerHealth()
	#..............sy..............

#Pressing Arguments -- Argument 3 -- Begin
func _on_FixedBTN_pressed():
	dialogPage = 0
	dialogCategory = "Fixed"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Those awards were said to be fixed in your favor"
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_ThreeCategoriesBTN_pressed():
	dialogPage = 0
	dialogCategory = "ThreeCategories"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "There was a different film that won those last three categories"
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
func _on_detectMovieBTN_pressed():
	dialogPage = 0
	dialogCategory = "recievedPraise"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = " A detective movie won the best picture"
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
func _on_PressuredBTN_pressed():
	dialogPage = 0
	dialogCategory = "Pressured"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Winning those awards left you feeling pressured rather than awarded "
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
#Pressing Arguments -- Argument 3 -- End



func _on_ResponseOTBTN_pressed():
	$ResponseOrphanTricked.visible = false
	get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel").page = -1
	
	

func _on_FellOffBikeBTN_pressed():
	
	dialogPage = 0
	dialogCategory = "desires"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If there hasn’t been a human in years, then how do you know that’s what the audience desires?"
	#$ResponseFellOffBike.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseFOBBTN_pressed():

	$ResponseFellOffBike.visible = false
	
	#get_node("ResponseFellOffBike/Panel/MarginContainer/RichTextLabel/ResponseFOBBTN").visible = false
	


func _on_CatGangBTN_pressed():
	dialogPage = 0
	dialogCategory = "recievedPraise"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Your film wasn’t the one that received that praise."
	#$ResponseCatGang.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	#..............sy.............
	#playerHealth()
	#..............sy..............


func _on_ResponseCGBTN_pressed():
	#get_node("ResponseFellOffBike/Panel/MarginContainer/RichTextLabel").page = -2
	#get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel").page = -2
	#get_node("ResponsePincer/Panel/MarginContainer/RichTextLabel").page = -2
	$ResponseCatGang.visible = false
	

	
#Aegument 3 -- end

#Argument 4 -- Begin
func _on_ScarierBTN_pressed():
	dialogPage = 0
	dialogCategory = "Scarier"
	$FourthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Deadtective was said to be scarier than your movie. "
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_HappyBTN_pressed():
	dialogPage = 0
	dialogCategory = "Happy"
	$FourthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The audience were happy that it wasn’t another horror movie."
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_ChaseBTN_pressed():
	dialogPage = 0
	dialogCategory = "Chase"
	$FourthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Viewers thought it didn’t have as many chase scenes as Deadtective. "
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_CharacterBTN_pressed():
	dialogPage = 0
	dialogCategory = "Characters"
	$FourthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The characters in your movie weren’t as compelling to the audience."
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
#Argument 4 -- End

#Argument 5 -- Begin

func _on_InterestedBTN_pressed():
	dialogPage = 0
	dialogCategory = "Interested"
	$FifthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The audience are no longer interested in watching horror movies"
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_CollabBTN_pressed():
	dialogPage = 0
	dialogCategory = "Collab"
	$FifthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You want to collaborate with the director of Deadtective to make something with him, instead."
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_HumanWantBTN_pressed():
	dialogPage = 0
	dialogCategory = "Human"
	$FifthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "She’'s not the human you want for this movie."
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
func _on_CastBTN_pressed():
	dialogPage = 0
	dialogCategory = "Cast"
	$FifthArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You’ve shown interest in following the ideas from your cast rather than your own."
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
#Argument 5 -- End




func _on_Prop1Btn_pressed():
	$PropositionBox.visible = true
	$CloseBTN.visible = true
	$PropositionBox/MarginContainer/HBoxContainer/PropositionText.text = "A hundred years have passed since the zombie outbreak ravaged civilization. Only one survivor of the outbreak remains: No one. Everyone who wasn’t a zombie is a zombie. Or just dead. “Living” life as a reanimated corpse with an unsatisfied craving for human flesh can bore you. That was when Goulstein saw their nostalgia as an opportunity. He specialized in making movies about zombies surviving the human apocalypse.  The zombies would bravely chase the terrifying and cowering humans and dine on their flesh. Of course, since humans are extinct, the humans in his movies are just zombies with rubber masks of human faces. Critics and the public loved his movies. Watching a constant stream of human outbreak movies was something the people could not get enough of. That was, until the people got enough. In recent years, less and less people came to watch his movies. His film crew were complaining about how tedious producing each film has been. His ego was blocking out their voices. The waning attention and rigid direction culminated in all three of his Zombie Bite movies to receive almost non existent attention. People would rather just be bored by themselves."
	pass # Replace with function body.

func _on_Prop2Btn_pressed():
	$PropositionBox.visible = true
	$CloseBTN.visible = true
	$PropositionBox/MarginContainer/HBoxContainer/PropositionText.text = "During the Global Ghoul awards, Ghoulstein’s third Zombie Bite movie won all categories. All categories, except best picture. That award was snubbed by Alien James Lapid, the one Martian resident living in our world (The future of the zombie apocalypse brings interesting residents.) He was responsible for making Deadtective, a detective movie with the plot twist that there wasn’t a killer since everyone was technically dead. People didn’t like the movie for its plot twist. Instead, they were impressed that it was a movie that deviated from the horror movies people were subjected to by Goulstein. We as his crew thought this would be  his wake up call. However, things change when he and the rest of us encounter an actual human. This girl said her name was Allison but Goulstein saw her as a ticket to a comeback. He got the cast to put her in a cage with the intention of starring her in his latest film: Zombie Dinner. It’s the typical movie that we’ve been making but with the selling point being that a live human will be actually devoured. A rare delicacy would be great, but it’s ultimately going to involve us making a movie that’s similar to what he’s already made. Even if this gets tickets selling, this won’t change that his creativity is as lively as his audience."
	
	pass # Replace with function body.



func _on_CloseBTN_pressed():
	$PropositionBox.visible = false
	$CloseBTN.visible = false
	pass # Replace with function body.
	
#..............sy..........	
func playerHealth():

	#yield(get_tree().create_timer(3),"timeout")

	health -= 1
	#int("you lose a lift")
	if health <= 0:
		
		get_tree().change_scene("res://GameOver.tscn")
	#	print("no more life")
		
func hideEnemyDialogueBox():
	#when the button is click, the enemy dialog box will be hidden
	$Enemy/EnemyDialogue.visible = false
	$Prop1Btn.visible = false
	$Prop2Btn.visible = false

func showEnemyDialogueBox():
	$Enemy/EnemyDialogue.visible = true
	$Prop1Btn.visible = true
	$Prop2Btn.visible = true
#..............sy..........










