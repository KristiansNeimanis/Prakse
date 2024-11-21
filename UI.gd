extends Control

@onready var time_label = $time_label
@onready var timer = $Timer

var total_time_in_seconds : int = 0

func _ready():
	Autoloads.collected_collectibles_updated.connect(update_collectibles_collected_display)
	
	timer.start()

func update_collectibles_collected_display():
	$AmountCollectedLabel.text = str(Autoloads.collected_collectibles) + "/" + str(Autoloads.total_collectibles) + " Collected"

func set_interaction_text_visible(text_visible : bool):
	$InteractionPrompt.visible = text_visible
	$CrossHair.visible = not text_visible

func set_interaction_label_text(new_text : String):
	$InteractionPrompt.text = new_text

func set_description_text_visible(text_visible : bool):
	$Description.visible = text_visible
	$CrossHair.visible = not text_visible
	
func set_description_label_text(new_text : String):
	$Description.text = new_text

func set_slot1_image(new_image : Texture):
	$Inventory/Slot_1/MarginContainer/TextureRect.texture = new_image
func set_slot2_image(new_image : Texture):
	$Inventory/Slot_2/MarginContainer/TextureRect.texture = new_image
func set_slot3_image(new_image : Texture):
	$Inventory/Slot_3/MarginContainer/TextureRect.texture = new_image

func set_slot1_name(new_name : String):
	$Inventory/name_1.text = new_name
func set_slot2_name(new_name : String):
	$Inventory/name_2.text = new_name
func set_slot3_name(new_name : String):
	$Inventory/name_3.text = new_name
	

func _on_timer_timeout():
	total_time_in_seconds += 1
	var m = int(total_time_in_seconds / 60.0)
	var s = total_time_in_seconds - m * 60
	time_label.text = '%02d:%02d' % [m,s]
