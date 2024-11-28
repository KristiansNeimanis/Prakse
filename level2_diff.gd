extends Difficulty

@onready var item_spawn_timer = $"../Item_spawn_timer"

func _ready():
	if(normal == true):
		pass
	if(hard == true):
		item_spawn_timer.wait_time = 55
	if(easy == true):
		item_spawn_timer.wait_time = 35
