extends RichTextLabel
var dialogTag
var dialogPicked =" "

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#var dialog = ["I don’t have to worry about that, especially when I have my Cat to keep me company. If you have time to be asking how i feel then you have time to be bludgeoned!"]




var page = 0#This is in in negative 2 in order to give a longer time for the picked response to remain.


# Called when the node enters the scene tree for the first time.
func _ready():
	#text = "Sentence 1"
#	print(node3) #Checking if object is null


	dialogPicked = " "
	#set_process_input(true)
	#set_bbcode(dialog[page])
	
	#set_visible_characters(0)
	
	pass # Replace with function body.
	

 
	
func _input(event):
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():

	#set_visible_characters(get_visible_characters()+1)
	pass # Replace with function body.





func _on_ResponseMostFearedBTN_pressed():

	pass # Replace with function body.
