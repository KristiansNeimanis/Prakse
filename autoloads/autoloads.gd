extends Node

signal collected_collectibles_updated
signal all_collectibles_collected

var total_collectibles = -1
var collected_collectibles = 0 :
	set(value):
		collected_collectibles = value
		emit_signal("collected_collectibles_updated")
		
		if value >= total_collectibles:
			emit_signal("all_collectibles_collected")

func initialize_variables(initial : int, total : int):
	total_collectibles = total
	collected_collectibles = initial
