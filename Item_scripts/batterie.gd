extends Itemsss

@onready var sprite = $Sprite3D

var database : SQLite
var i_name
var desc


func _init():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	i_name = database.select_rows("item","item_id = 1", ["item_name"])
	interaction_prompt_text_item = "Press 'E' to pick up " + i_name[0]["item_name"]
	item_name = i_name[0]["item_name"]
	
	desc = database.select_rows("item","item_id = 1", ["item_description"])
	item_description = "Description: " + desc[0]["item_description"]
	
	item_icon = preload("res://Item_icons/d0647a0a-6d82-4ab7-8569-d5fb7eeb5762.png")

func interacted_with_item():
	print("Collected: " + i_name[0]["item_name"])
	queue_free()
