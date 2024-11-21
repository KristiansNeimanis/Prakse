extends Node3D
@onready var animationplayer = $CanvasLayer/AnimationPlayer
@onready var canvas_layer = $CanvasLayer
@onready var collected = $Collected
@onready var light = $Light

var database : SQLite

# Called when the node enters the scene tree for the first time.
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
	
	var total_lvl1_p = database.select_rows("stats", "row_id = 1", ["total_level_1_pages_collected"])
	var updated_t_lvl1_p = total_lvl1_p[0]["total_level_1_pages_collected"] + Autoloads.collected_collectibles
	
	var total_loses = database.select_rows("stats", "row_id = 1", ["total_loses"])
	var updated_t_l = total_loses[0]["total_loses"] + 1
	
	var lvl1_loses = database.select_rows("stats", "row_id = 1", ["level_1_loses"])
	var updated_lvl1_l = lvl1_loses[0]["level_1_loses"] + 1
	
	database.update_rows("stats", "row_id = 1", {"total_pages_collected": updated_t_p, "total_level_1_pages_collected": updated_t_lvl1_p, "total_loses": updated_t_l, "level_1_loses": updated_lvl1_l})


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_1/node_3d.tscn")
