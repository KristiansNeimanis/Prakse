extends Difficulty

@onready var stalker_2 = $".."

func _ready():
	if(normal == true):
		pass
	if(hard == true):
		stalker_2.SPEED = 3.0
	if(easy == true):
		stalker_2.SPEED = 2.1
