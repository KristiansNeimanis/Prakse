extends Control

func _ready():
	Autoloads.collected_collectibles_updated.connect(update_collectibles_collected_display)

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
