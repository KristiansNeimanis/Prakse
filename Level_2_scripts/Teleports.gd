extends Node3D

@onready var tp = $"../Tp"

@onready var player = $"../Player"
@onready var stalker_2 = $"../Stalker2"

var collected = false

var teleports : Array
@onready var timer = $"../Timer"

func _ready():
	teleports = get_children()

func _process(delta):
	if Autoloads.collected_collectibles == 1 and collected == false:
		start_random_timer()
		collected = true
		

func start_random_timer():
	var random_time = randi() % 21 + 40  # Random value between 40 and 60
	timer.wait_time = random_time
	timer.start()

func find_second_closest_teleport() -> Node:
		# Create a list of distances and their corresponding nodes
	var distances = []
		
	for teleport in teleports:
		var distance = player.global_transform.origin.distance_to(teleport.global_transform.origin)
		distances.append({ "distance": distance, "teleport": teleport })
		
	# Sort the distances array by distance
	distances.sort_custom(sort_ascending)
		
	# Return the second closest teleport node (index 1)
	if distances.size() >= 2:
		return distances[1]["teleport"]
	else:
		return null


func _on_timer_timeout():
	# Find the second closest teleport node to the player
	var second_closest_teleport = find_second_closest_teleport()
	
	if second_closest_teleport:
		# Set the enemy's position to the second closest teleport node's position
		stalker_2.global_transform.origin = second_closest_teleport.global_transform.origin
		tp.global_transform.origin = second_closest_teleport.global_transform.origin
		tp.play()
	
	# Restart the timer
	start_random_timer()

func sort_ascending(a, b):
	if a["distance"] < b["distance"]:
		return true
	else:
		return false
