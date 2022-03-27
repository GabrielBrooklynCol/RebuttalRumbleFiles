extends CanvasLayer


func _ready():
	$Inventory.visible = false

func _input(event):
	if event.is_action_pressed("inventory") && $Inventory.visible == false:
		$Inventory.visible = true
		$Inventory.initialize_inventory()
		get_tree().paused = true
	elif event.is_action_pressed("inventory") && $Inventory.visible == true:
		$Inventory.visible = false
		$Inventory.initialize_inventory()
		get_tree().paused = false
