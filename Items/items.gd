class_name Itemsss
extends Node

var interaction_prompt_text_item = "Press 'E' to pick up " + self.name
var item_description = "something"
var item_icon;
var item_name;

func interacted_with_item():
	print("Interacted with: " + self.name)
