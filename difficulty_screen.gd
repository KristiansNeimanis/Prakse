extends Node3D

@onready var normal_checkbox = $Control/normal
@onready var hard_checkbox = $Control/hard
@onready var easy_checkbox = $Control/easy

@onready var description = $Control/Description

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	var normal = database.select_rows("difficulty","row_id = 1", ["normal"])
	var hard = database.select_rows("difficulty","row_id = 1", ["hard"])
	var easy = database.select_rows("difficulty","row_id = 1", ["easy"])
	
	if(normal[0]["normal"] == 1):
		normal_checkbox.button_pressed = true
		hard_checkbox.button_pressed = false
		easy_checkbox.button_pressed = false
		
	if(hard[0]["hard"] == 1):
		hard_checkbox.button_pressed = true
		normal_checkbox.button_pressed = false
		easy_checkbox.button_pressed = false
		
	if(easy[0]["easy"] == 1):
		easy_checkbox.button_pressed = true
		hard_checkbox.button_pressed = false
		normal_checkbox.button_pressed = false

func _on_normal_pressed():
	description.text = "Normal Difficulty:
		
		Monster speed is average.
		Item spawn frequency is average."
	
	hard_checkbox.button_pressed = false
	easy_checkbox.button_pressed = false
	
	database.update_rows("difficulty", "row_id = 1", {"normal": 1, "hard": 0, "easy": 0})


func _on_hard_pressed():
	description.text = "Hard Difficulty:
		
		Monster speed is as fast as the players walking speed from the start.
		Item spawn frequency is lower than average."
	normal_checkbox.button_pressed = false
	easy_checkbox.button_pressed = false
	
	database.update_rows("difficulty", "row_id = 1", {"normal": 0, "hard": 1, "easy": 0})



func _on_easy_pressed():
	description.text = "Easy Difficulty:
		
		Monster speed will not surpass the players walking speed.
		Item spawn frequency is slightly higher than average."
	normal_checkbox.button_pressed = false
	hard_checkbox.button_pressed = false
	
	database.update_rows("difficulty", "row_id = 1", {"normal": 0, "hard": 0, "easy": 1})


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
