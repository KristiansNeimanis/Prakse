class_name  Interactable
extends Node

var interaction_prompt_text = "Press 'E' to interact"

func interacted_with():
	print("Interacted with " + self.name)
