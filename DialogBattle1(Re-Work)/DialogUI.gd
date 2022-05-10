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
func _on_MostFearedBTN_pressed(): #Wrong
	#$DialogOptionsContainer.visible = false
	#get_node("Response/Panel/MarginContainer/RichTextLabel").page = 
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Doesn’t it get lonely being the most feared?"
	dialogCategory = "MostFeared"
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
	if dialogPage == 1 && dialogCategory == "MostFeared":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I don’t have to worry about that, especially when I have my Cat to keep me company. You try asking how I feel then you're asking for trouble!"
	if dialogPage == 2 && dialogCategory == "MostFeared":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	dialogPage += 1
	print(dialogPage)
	

	
	if dialogPage == 1 && dialogCategory == "Toe2Toe":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They didn’t do a lot of standing, more so, what we call \"Laying down dead.\" You sound mighty eager to learn what that is."
		
	if dialogPage == 2 && dialogCategory == "Toe2Toe":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............
	
	if dialogPage == 1 && dialogCategory == "Monster":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "N-not if they’re stupid enough to walk to their own death, and it's looking like you're about to make those steps!"
	if dialogPage == 2 && dialogCategory == "Monster":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$DialogOptionsContainer.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	if dialogPage == 1 && dialogCategory == "Family":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They wouldn’t know what family is if it were conditioned into em!" 
	if dialogPage == 2 && dialogCategory == "Family":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I gave them everything, house, security, a romantic saloon, and they had the gall to go after my female!"
	if dialogPage == 3 && dialogCategory == "Family":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = " Just look at the kind of moves they tried to pull!"
		
	if dialogPage == 4 && dialogCategory == "Family":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "Cat and I are the most romantic couple the Badhlands had ever seen. She’s not much of a talker, but that’s because she knew his Zerky would say what she wanted to say. The thing we had in common the most was how much we loved each other…"
		#.............sy.............
		showEnemyDialogueBox()
		#.............sy.............
		
	# Argument 1 - END
 #Argument 2 -- Begin
	
	if dialogPage == 1 && dialogCategory == "NotWant":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "How would you know!? Cat can't resists the Wuviest Duviest bandit that ever Wuvied."
	
	if dialogPage == 2 && dialogCategory == "NotWant":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That jealousy from you and that excuse I called a gang ticks me off!" 

	if dialogPage == 3 && dialogCategory == "NotWant":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy..........
		#when the dialog is finished, the enemy dialogue box show up again
		showEnemyDialogueBox()
		playerHealth()
		#.............sy..........
	if dialogPage == 1 && dialogCategory == "KnewOfLove":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They wouldn't have the galls too! Those boys were prolly planning on getting the drop on both of us."
	
	if dialogPage == 2 && dialogCategory == "KnewOfLove":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Then again, nothin was stopping them before."
		
	if dialogPage == 3 && dialogCategory == "KnewOfLove":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Ha...they couldn't even bother to do so. They saw me as dead weight and went off on their own."
	
	if dialogPage == 4 && dialogCategory == "KnewOfLove":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "That doesn't matter, and you can't make that matter!"

	if dialogPage == 5 && dialogCategory == "KnewOfLove":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My gang left me because they don’t see me as their leader. I’m not one of them anymore. They went on their own because they don’t want me to do with none of their achievements. I’m no longer a Pincer in their eyes. That don’t matter.  I’m going my own way. Zerksees will make his own path with his lovely Cat!"
		$ThirdArgument.visible = true
		#.............sy.............
		showEnemyDialogueBox()
		#.............sy.............
	
	if dialogPage == 1 && dialogCategory == "LoveAsMuch":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "No, I didn't. My heart's reserved for Cat's and Cat's alone. They just wanna force themselves between us and break it." 
	
	if dialogPage == 2 && dialogCategory == "LoveAsMuch":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's soundin like yer tryna break that, too..." 
		
	if dialogPage == 3 && dialogCategory == "LoveAsMuch":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		showEnemyDialogueBox()
		playerHealth()
		#.............sy.............
	
	if dialogPage == 1 && dialogCategory == "TriedGetWay":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Oh, where do I even start?"
	
	if dialogPage == 2 && dialogCategory == "TriedGetWay":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Not in the slightest. They ask for talented direction, they get talented direction!"
	
	if dialogPage == 3 && dialogCategory == "TriedGetWay":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's easier telling you the first time I drank my happy and sleepy juice, or as we call it, booze."
		
	if dialogPage == 3 && dialogCategory == "TriedGetWay":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Nah, I need to address their audacities proper"
	if dialogPage == 2 && dialogCategory == "TriedGetWay":
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/NotWantBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/OldSelfBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/KnewOfLoveBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer/FallInLoveBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/LoveAsMuchBTN").visible = false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/MadeYouHappyBTN").visible = true
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/TriedGetWayBTN").visible =false
		get_node("SecondArgument/Panel/MarginContainer/Panel/HBoxContainer2/ShowerGiftsBTN").visible = true
		get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My own gang would always try to get close to my Cat! They’d do anything to talk to her as if I didn’t notice. It’s obvious that they wanted to ruin the love between the both of us. I had threatened to kick them out or made them work in the Smooch and Kiss. Why would did they treat me like they did?"
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		showEnemyDialogueBox()
		#.............sy.............
		
	#Pressing Arguments for Argument 2 -- BEGIN
	if dialogPage == 1 && dialogCategory == "OldSelf":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "There's no old self there's just the Zerksees self. The self which only commands respect and fear."
		
	if dialogPage == 2 && dialogCategory == "OldSelf":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = " If they don't recognized that, then they fail to learn who's top dog."
		
	if dialogPage == 3 && dialogCategory == "OldSelf":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It sounding like you're in need of learnin."
		
	if dialogPage == 4 && dialogCategory == "OldSelf":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		
		showEnemyDialogueBox()
		playerHealth()
			#.............sy.............
		
	if dialogPage == 1 && dialogCategory == "FallInLove":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "She wouldn't even THINK of giving em the littlest of puppy dog love!"
		
	if dialogPage == 2 && dialogCategory == "FallInLove":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Better watch that tone... you soundin like yer conspirin with em."
		
	if dialogPage == 3 && dialogCategory == "FallInLove":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
			#.............sy.............
			
	
	if dialogPage == 1 && dialogCategory == "ShowerGifts":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "My gang already has their gifts: The gift of being in my gang!" 
	
	if dialogPage == 2 && dialogCategory == "ShowerGifts":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "With what you're spewing, the gift you're in need of is bein less stupid!" 
	
	if dialogPage == 3 && dialogCategory == "ShowerGifts":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$SecondArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

		#Pressing Arguments for Argument 2 -- END
	
	#Argument 2 -- END
	
	#Argument 3 -- BEGIN
	
	if dialogPage == 1 && dialogCategory == "Pincer":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "I'm...still one of them? Even after all I put them through, they still see me as one of their own."
	
	if dialogPage == 2 && dialogCategory == "Pincer":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Ha. You didn't even raise a pinkie, and yet you manage to got me spilling this much."
	
	if dialogPage == 3 && dialogCategory == "Pincer":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Doing something like that is enough for you to be a corpse."
	
	if dialogPage == 4 && dialogCategory == "Pincer":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "But, I guess I don't have it in me now. Must've been convinced."
	
	if dialogPage == 5 && dialogCategory == "Pincer":
		pass #Change to Level 2 Scene
	

	if dialogPage == 1 && dialogCategory == "Orphan":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If that were the case, then why would they leave me alive?" 
	
	if dialogPage == 2 && dialogCategory == "Orphan":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Besides, my precious orphans would never do that, especially the ones I personally orphaned!" 
	
	if dialogPage == 3 && dialogCategory == "Orphan":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Zerksees"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "The stupid things yer saying is gonna make me orphan you from livin!" 
		
	if dialogPage == 4 && dialogCategory == "Orphan":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "FellOffBike":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "FellOffDaBike was our ride or die, but no way was he a close enough mate for them to do that."
	
	if dialogPage == 2 && dialogCategory == "FellOffBike":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "If they were gonna do something like that, then they flat out would of done me in."
	
	if dialogPage == 3 && dialogCategory == "FellOffBike":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Like I might to the drongo whose spouting her assanine assumptions!"
	
	if dialogPage == 4 && dialogCategory == "FellOffBike":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............

	
	if dialogPage == 1 && dialogCategory == "CatGang":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It's the law of the Badhlands that only one gang rides her sands!"
	
	
	if dialogPage == 2 && dialogCategory == "CatGang":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Sparing us because of that would be a disrespect to me and themselves!"
	
	if dialogPage == 3 && dialogCategory == "CatGang":
		get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Ghoulstein"
		get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Quit trying to disrespect, girlie!"


	if dialogPage == 4 && dialogCategory == "CatGang":
		$ResponseAcclaimed.visible = false
		$NameTag.visible = false
		$ThirdArgument.visible = true
		#.............sy.............
		playerHealth()
		showEnemyDialogueBox()
		#.............sy.............
	#Argument 3 -- END
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

func _on_T2TBTN_pressed(): 
	dialogPage = 0
	dialogCategory = "Toe2Toe"
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You can't be the best when there were gangs and villagers that stood toe to toe against you"

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
	dialogCategory = "Monster"
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You’ve made yourself an easy target for your own gang to think that"
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
	dialogCategory = "Family"
	$DialogOptionsContainer.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Your gang see you as the head of it's family."
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
	dialogCategory = "NotWant"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Did you ever have the feeling that she didn’t want to be with you?"
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	
	
func _on_ResponseNotWantBTN_pressed():
	$ResponseNotWant.visible = false
	get_node("ResponseNotWant/Panel/MarginContainer/RichTextLabel/ResponseNotWantBTN").visible = false


func _on_KnewOfLoveBTN_pressed():
	dialogPage = 0
	dialogCategory = "KnewOfLove"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Your gang knew about your love and left with just the two of you here."
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
	dialogCategory = "LoveAsMuch"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "You love your gang just as much you do Cat."
	#..............sy.............
	#playerHealth()
	#..............sy..............

func _on_ResponseLAMBTN_pressed():
	$ResponseLoveAsMuch.visible = false
	get_node("ResponseLoveAsMuch/Panel/MarginContainer/RichTextLabel/ResponseLAMBTN").visible = false


func _on_TriedGetWayBTN_pressed():
	#$ResponseTriedGetWay.visible = true
	dialogPage = 0
	dialogCategory = "TriedGetWay"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	#get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Haven’t you complained to your film crew about not following your vision?"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "It makes me wonder how the gang tried getting in the way of your love"
	
func _on_ResponseTGWBTN_pressed():
	$ResponseTriedGetWay.visible = false
	$SecondArgument.visible = false
	PressingOptions = 1
	$ArgueOrProposition.visible = true
	get_node("Enemy/EnemyDialogue/MarginContainer/HBoxContainer/EnemyText").text = "My own gang would always try to get close to my Cat! They’d do anything to talk to her as if I didn’t notice. It’s obvious that they wanted to ruin the love between the both of us. I had threatened to kick them out or made them work in the Smooch and Kiss. Why would did they treat me like they did?"
	 # Replace with function body.
	# Pressing argument for Argument 2 --- Begin

func _on_FallInLoveBTN_pressed():
	dialogPage = 0
	dialogCategory = "FallInLove"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They did that in the hopes she would fall in love with them."


func _on_ResponseFILBTN_pressed():
	$ResponseFallInLove.visible = false
	get_node("ResponseFallInLove/Panel/MarginContainer/RichTextLabel/ResponseFILBTN").visible = false

func _on_OldSelfBTN_pressed():
	dialogPage = 0
	dialogCategory = "OldSelf"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They have done that in the hopes that you’d be back to your old self."

func _on_ResponseOldSelfBTN_pressed():
	$ResponseOldSelf.visible = false
	get_node("ResponseOldSelf/Panel/MarginContainer/RichTextLabel/ResponseOldSelfBTN").visible = false

func _on_ShowerGiftsBTN_pressed():
	dialogPage = 0
	dialogCategory = "ShowerGifts"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They did that so you can shower them with gifts instead."


func _on_ResponseSGBTN_pressed():
	$ResponseShowerGifts.visible = false
	get_node("ResponseShowerGifts/Panel/MarginContainer/RichTextLabel/ResponseSGBTN").visible = false
	
func _on_MadeYouHappyBTN_pressed():
	dialogPage = 0
	dialogCategory = "KnewOfLove"
	$SecondArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "But they didn’t. They left you with her, knowing she made you happy."
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
	dialogCategory = "Pincer"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Your gang leaving didn’t stop them from believing you’re their leader."
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
	dialogCategory = "Orphan"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "Out of revenge, one of the orphans tricked your team to turn against you."
	#$ResponseOrphanTricked.visible = true
	#get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel/ResponseOTBTN").visible = false
	#..........sy.............
	hideEnemyDialogueBox()
	#............sy...........
	#..............sy.............
	#playerHealth()
	#..............sy..............




func _on_ResponseOTBTN_pressed():
	$ResponseOrphanTricked.visible = false
	get_node("ResponseOrphanTricked/Panel/MarginContainer/RichTextLabel").page = -1
	
	

func _on_FellOffBikeBTN_pressed():
	
	dialogPage = 0
	dialogCategory = "FellOffBike"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "This was all done to make you feel guilty for how you responded to FellOffDaBike's death."
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
	dialogCategory = "CatGang"
	$ThirdArgument.visible = false
	$NameTag.visible = true
	$ResponseAcclaimed.visible = true
	get_node("NameTag/Panel/MarginContainer/RichTextLabel").text = "Naomi"
	get_node("ResponseAcclaimed/Panel/MarginContainer/RichTextLabel").text = "They’ve left you with the hope that you and Cat will start your own gang."
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
	

	
#Argument 3 -- end
func _on_Prop1Btn_pressed():
	$PropositionBox.visible = true
	$CloseBTN.visible = true
	$PropositionBox/MarginContainer/HBoxContainer/PropositionText.text = "In the scorching heat of the Badhlands, there’s no other gang you’ll see ruling over its sands than the fierce Pincer! We ride on our hogs and cause a living heck to those who are in our way and those dumb enough to get in our way. Whenever a gang has a problem with us, we show them how we’re actually top-of-the-line plastic surgeons! They come to us with their heads, then they leave without one! Anything you can think of, killing, stealing, harsh language, our gang has done it as one. And that was thanks to our leader, Zerksees. None of us could have faced the lands on our own, but he managed to cobble together lonely bikers, orphaned children, and children he made into orphans and formed into something we’ve called our family."
	pass # Replace with function body.

func _on_Prop2Btn_pressed():
	$PropositionBox.visible = true
	$CloseBTN.visible = true
	$PropositionBox/MarginContainer/HBoxContainer/PropositionText.text = "During a friendly pillage session in a distant village, Zerksees found himself a lady. He called her Cat because she looked as cut as one she would always run to the corner whenever he was close to her like one. Ever since they met, he acted like a completely different person. He would often give her gifts such as bear plushies but they were often thrown around or torn apart. Since I, Ryder ofBooks, was the only one capable of writing in the gang, he made me transcribe his love letter. As always, she didn’t respond to what she said. In fact, she’d be more inclined to talk to anyone else besides him. This would upset Zirksees, and if he were to catch anyone talking to her or even make eye contact he’d get into a fight with them.\n" +"The worse possible thing to come out of his obsession was his response to the loss of one of our mates. After our beloved member FelloffDaBike anDied passed away from a cold, we thought Zerksees would think of a way to honor his death. What we got after his passing, instead, was our Saloon’s name changed from The Stab and Kill to The Smooch and Kiss. He also had the place decorated with paper hearts and streamers and had the bartender dressed up like those babies with wings, diaper and everything! He was still obsessed with trying to impress his girl even after one of our own is not with us. After seeing what he’s done with the saloon, it seems FelloffDaBike was the lucky one. At that point, we knew that Zerksees was also gone. We haven’t had a good raid in forever, and we depend on those! I and the rest of us are off tomorrow. We’ll just leave the both of them on their own. From one Pincer to another."
	
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










