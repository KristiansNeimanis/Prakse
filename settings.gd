extends Node3D

@onready var normal_checkbox = $Control/normal
@onready var hard_checkbox = $Control/hard
@onready var easy_checkbox = $Control/easy

@onready var description = $Control/Description
	
var database : SQLite
var path = "res://Scrips/DB/items_&_stats.db"
func _ready():
	database = SQLite.new()
	database.path = path
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


func _on_volume_value_changed(value):
	AudioServer.set_bus_volume_db(0, value)


func _on_option_button_item_selected(index):
	match index:
		0:
			DisplayServer.window_set_size(Vector2i(1920,1080))
		1:
			DisplayServer.window_set_size(Vector2i(1280,720))
		2:
			DisplayServer.window_set_size(Vector2i(800,600))


func _on_window_mode_item_selected(index):
	match index:
		0: #fullscreen
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		1: #windowed
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, false)
		2: #windowed borderless
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
		3: #fullscreen borderless
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
			DisplayServer.window_set_flag(DisplayServer.WINDOW_FLAG_BORDERLESS, true)
