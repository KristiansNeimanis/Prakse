extends Node3D

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	var total_p = database.select_rows("stats", "row_id = 1", ["total_pages_collected"])
	var updated_t_p = total_p[0]["total_pages_collected"] + 8
	
	var total_lvl2_p = database.select_rows("stats", "row_id = 1", ["total_level_2_pages_collected"])
	var updated_t_lvl2_p = total_lvl2_p[0]["total_level_2_pages_collected"] + 8
	
	var total_wins = database.select_rows("stats", "row_id = 1", ["total_wins"])
	var updated_t_w = total_wins[0]["total_wins"] + 1
	
	var lvl2_wins = database.select_rows("stats", "row_id = 1", ["level_2_wins"])
	var updated_lvl2_w = lvl2_wins[0]["level_2_wins"] + 1
	
	database.update_rows("stats", "row_id = 1", {"total_pages_collected": updated_t_p, "total_level_2_pages_collected": updated_t_lvl2_p, "total_wins": updated_t_w, "level_2_wins": updated_lvl2_w})

func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_2/level_2.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
