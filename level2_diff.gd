extends Node3D

@onready var item_spawn_timer = $"../Item_spawn_timer"

var database : SQLite

func _ready():
	database = SQLite.new()
	database.path = "res://Scrips/DB/items_&_stats.db"
	database.open_db()
	
	var normal = database.select_rows("difficulty","row_id = 1", ["normal"])
	var hard = database.select_rows("difficulty","row_id = 1", ["hard"])
	var easy = database.select_rows("difficulty","row_id = 1", ["easy"])
	
	if(normal[0]["normal"] == 1):
		pass
	if(hard[0]["hard"] == 1):
		item_spawn_timer.wait_time = 55
	if(easy[0]["easy"] == 1):
		item_spawn_timer.wait_time = 35
