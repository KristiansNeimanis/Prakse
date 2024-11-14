extends Itemsss

func _init():
	interaction_prompt_text_item = "Press 'E' to pick up"

func interacted_with_item():
	print("Collected: " + self.name)
	queue_free()
