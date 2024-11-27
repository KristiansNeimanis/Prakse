extends Itemsss

var database : SQLite
var i_name
var desc

func _init():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	i_name = database.select_rows("item","item_id = 4", ["item_name"])
	interaction_prompt_text_item = "Press 'E' to pick up " + i_name[0]["item_name"]
	item_name = i_name[0]["item_name"]
	
	desc = database.select_rows("item","item_id = 4", ["item_description"])
	item_description = "Description: " + desc[0]["item_description"]
	
	item_icon = preload("res://Item_icons/6bc4aa42-09d4-44fc-b6f8-1de6162e7bb5.png")

func interacted_with_item():
	print("Collected: " + i_name[0]["item_name"])
	queue_free()


func _on_timer_timeout():
	queue_free()
