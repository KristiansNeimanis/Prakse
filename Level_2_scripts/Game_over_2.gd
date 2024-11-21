extends Node3D
@onready var collected = $Collected
@onready var animationplayer = $CanvasLayer/AnimationPlayer
@onready var canvas_layer = $CanvasLayer
@onready var light = $Light

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	collected.text = "Total pages collected " + str(Autoloads.collected_collectibles)
	animationplayer.play("death")
	await Signal(animationplayer, "animation_finished")
	light.play("Light")
	canvas_layer.queue_free()
	
	
	var total_p = database.select_rows("stats", "row_id = 1", ["total_pages_collected"])
	var updated_t_p = total_p[0]["total_pages_collected"] + Autoloads.collected_collectibles
	
	var total_lvl2_p = database.select_rows("stats", "row_id = 1", ["total_level_2_pages_collected"])
	var updated_t_lvl2_p = total_lvl2_p[0]["total_level_2_pages_collected"] + Autoloads.collected_collectibles
	
	var total_loses = database.select_rows("stats", "row_id = 1", ["total_loses"])
	var updated_t_l = total_loses[0]["total_loses"] + 1
	
	var lvl2_loses = database.select_rows("stats", "row_id = 1", ["level_2_loses"])
	var updated_lvl2_l = lvl2_loses[0]["level_2_loses"] + 1
	
	database.update_rows("stats", "row_id = 1", {"total_pages_collected": updated_t_p, "total_level_2_pages_collected": updated_t_lvl2_p, "total_loses": updated_t_l, "level_2_loses": updated_lvl2_l})

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_2/level_2.tscn")
