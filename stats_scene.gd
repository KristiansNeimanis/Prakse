extends Node3D

@onready var total_wins = $stats/Total_wins
@onready var total_loses = $stats/Total_Loses
@onready var total_pages_collected = $stats/Total_Pages_Collected

@onready var level_1_wins = $stats/Level_1_wins
@onready var level_2_wins = $stats/Level_2_wins 

@onready var level_1_loses = $stats/Level_1_Loses
@onready var level_2_loses = $stats/Level_2_Loses

@onready var level_1_pages = $stats/Level_1_Pages
@onready var level_2_pages = $stats/Level_2_Pages

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()

func _process(delta):
	#wins
	var t_wins = database.select_rows("stats","", ["total_wins"])
	total_wins.text = "Total Wins: " + str(t_wins[0]["total_wins"])
	var t_wins1 = database.select_rows("stats","", ["level_1_wins"])
	level_1_wins.text = "Level 1 Wins: " + str(t_wins1[0]["level_1_wins"])
	var t_wins2 = database.select_rows("stats","", ["level_2_wins"])
	level_2_wins.text = "Level 2 Wins: " + str(t_wins2[0]["level_2_wins"])
	
	#loses
	var t_loses = database.select_rows("stats","", ["total_loses"])
	total_loses.text = "Total Loses: " + str(t_loses[0]["total_loses"])
	var t_loses1 = database.select_rows("stats","", ["level_1_loses"])
	level_1_loses.text = "Level 1 Loses: " + str(t_loses1[0]["level_1_loses"])
	var t_loses2 = database.select_rows("stats","", ["level_2_loses"])
	level_2_loses.text = "Level 2 Loses: " + str(t_loses2[0]["level_2_loses"])
	
	#pages
	var t_pages = database.select_rows("stats","", ["total_pages_collected"])
	total_pages_collected.text = "Total Pages Collected: " + str(t_pages[0]["total_pages_collected"])
	var t_pages1 = database.select_rows("stats","", ["total_level_1_pages_collected"])
	level_1_pages.text = "Total Level 1 Pages: " + str(t_pages1[0]["total_level_1_pages_collected"])
	var t_pages2 = database.select_rows("stats","", ["total_level_2_pages_collected"])
	level_2_pages.text = "Total Level 2 Pages: " + str(t_pages2[0]["total_level_2_pages_collected"])

func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_reset_stats_pressed():
	database.update_rows("stats", "row_id = 1", {"total_wins":0, "level_1_wins":0, "level_2_wins":0, "total_loses":0, "level_1_loses":0, "level_2_loses":0, "total_pages_collected":0, "total_level_1_pages_collected":0, "total_level_2_pages_collected":0})
	pass
