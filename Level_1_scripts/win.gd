extends Node3D

var database : SQLite

# Called when the node enters the scene tree for the first time.
func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var total_p = database.select_rows("stats", "row_id = 1", ["total_pages_collected"])
	var updated_t_p = total_p[0]["total_pages_collected"] + 8
	
	var total_lvl1_p = database.select_rows("stats", "row_id = 1", ["total_level_1_pages_collected"])
	var updated_t_lvl1_p = total_lvl1_p[0]["total_level_1_pages_collected"] + 8
	
	var total_wins = database.select_rows("stats", "row_id = 1", ["total_wins"])
	var updated_t_w = total_wins[0]["total_wins"] + 1
	
	var lvl1_wins = database.select_rows("stats", "row_id = 1", ["level_1_wins"])
	var updated_lvl1_w = lvl1_wins[0]["level_1_wins"] + 1
	
	database.update_rows("stats", "row_id = 1", {"total_pages_collected": updated_t_p, "total_level_1_pages_collected": updated_t_lvl1_p, "total_wins": updated_t_w, "level_1_wins": updated_lvl1_w})

func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_1/node_3d.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
