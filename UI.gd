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
