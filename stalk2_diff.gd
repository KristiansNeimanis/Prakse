extends Node3D

@onready var stalker_2 = $".."

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	var normal = database.select_rows("difficulty","row_id = 1", ["normal"])
	var hard = database.select_rows("difficulty","row_id = 1", ["hard"])
	var easy = database.select_rows("difficulty","row_id = 1", ["easy"])
	
	if(normal[0]["normal"] == 1):
		print("normal")
		
	if(hard[0]["hard"] == 1):
		stalker_2.SPEED = 3.0
		stalker_2.page_2 = false
		stalker_2.page_4 = false
		stalker_2.page_6 = false
		print("hard")
		
	if(easy[0]["easy"] == 1):
		stalker_2.SPEED = 2.1
		print("easy")
