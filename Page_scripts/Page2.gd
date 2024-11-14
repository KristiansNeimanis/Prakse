extends Interactable

func _init():
	interaction_prompt_text = "Press 'E' to collect"

func interacted_with():
	print("collected: " + self.name)
	Autoloads.collected_collectibles += 1
	queue_free()
