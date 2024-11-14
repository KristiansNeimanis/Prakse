extends Node3D
@onready var tp = $Tp

@onready var player = $TestPlayer
@onready var stalker = $Stalker

var paused = false
@onready var pause_menu = $PauseMenu

var viz = true

@onready var shader = $CanvasLayer2/ColorRect

#teleport stuff
var teled = false
@onready var timer = $TeleTimer
var d

var max_distance = 24
var min_distance = 20

var max_time = 40
var min_time = 20
var player_pos: Vector3

var page_4 = true
var page_5 = true
var page_6 = true
var page_7 = true

var timer_stoped = true

func _physics_process(_delta):
	#timer
	var rng = RandomNumberGenerator.new()
	if timer_stoped == true:
		var rand = rng.randf_range(min_time, max_time)
		timer.wait_time = rand
		timer.start()
		timer_stoped = false
	
	#pause
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()
	
	#position
	get_tree().call_group("Stalker", "update_target_location", player.global_transform.origin)
	
	player_pos = player.global_transform.origin
	var stalker_pos = stalker.global_transform.origin
	
	#teleport
	d = player_pos.distance_to(stalker_pos)
	if d > max_distance:
		timer_stoped = true
		teleport_within_donut()
	
	if Autoloads.collected_collectibles == 8:
		get_tree().change_scene_to_file("res://Levels/Level_1/win.tscn")
	if Autoloads.collected_collectibles == 1 and viz == true:
		stalker.visible = true
		stalker.process_mode = Node.PROCESS_MODE_INHERIT
		viz = false
	
	#decrease zone size
	if Autoloads.collected_collectibles == 4 and page_4 == true:
		max_distance -= 1
		min_distance -= 1
		max_time -= 2
		min_time -= 1
		page_4 = false
	if Autoloads.collected_collectibles == 5 and page_5 == true:
		max_distance -= 1
		min_distance -= 1
		max_time -= 2
		min_time -= 1
		page_5 = false
	if Autoloads.collected_collectibles == 6 and page_6 == true:
		max_distance -= 1.5
		min_distance -= 1.5
		max_time -= 2
		min_time -= 1
		page_6 = false
	if Autoloads.collected_collectibles == 7 and page_7 == true:
		max_distance -= 3
		min_distance -= 3
		max_time -= 1
		min_time -= 1
		page_7 = false
		
		

func _ready():
	stalker.visible = false
	stalker.process_mode = Node.PROCESS_MODE_DISABLED
	Autoloads.initialize_variables(0, get_tree().get_nodes_in_group("Pages").size() -2)
	var rand1 = get_tree().get_nodes_in_group("Pages").pick_random()
	var rand2 = get_tree().get_nodes_in_group("Pages").pick_random()
	
	while rand1 == rand2:
		rand2 = get_tree().get_nodes_in_group("Pages").pick_random()
	
	rand1.queue_free()
	rand2.queue_free()

func pauseMenu():
	if paused:
		pause_menu.hide()
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		get_tree().paused = false
	else:
		pause_menu.show()
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().paused = true
	paused = !paused

func teleport_within_donut():
	if viz == false:
		# Teleport within a donut-shaped zone around the player
		var angle = randf() * TAU  # Random angle in radians
		var radius = lerp(min_distance, max_distance, randf())  # Random radius within min and max
		
		# Generate a random position within the donut in 3D space
		var x = cos(angle) * radius
		var z = sin(angle) * radius
		var teleport_position = player_pos - Vector3(x, 0, z)
		
		stalker.global_transform.origin = teleport_position
		tp.global_transform.origin = teleport_position
		if teled == false:
			teled = true
		else:
			tp.play()


func _on_tele_timer_timeout():
	teleport_within_donut()
	timer_stoped = true
