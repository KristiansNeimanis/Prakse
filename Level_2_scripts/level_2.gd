extends Node3D

@onready var page = $Pages/Page
@onready var page_2 = $Pages/Page2
@onready var page_3 = $Pages/Page3
@onready var page_4 = $Pages/Page4
@onready var page_5 = $Pages/Page5
@onready var page_6 = $Pages/Page6
@onready var page_7 = $Pages/Page7
@onready var page_8 = $Pages/Page8
@onready var page_9 = $Pages/Page9
@onready var page_10 = $Pages/Page10


@onready var player = $Player
@onready var stalker_2 = $Stalker2

var viz = true

@onready var pause_menu = $PauseMenu
var paused = false



func  _ready():
	stalker_2.visible = false
	stalker_2.process_mode = Node.PROCESS_MODE_DISABLED
	
	Autoloads.initialize_variables(0, get_tree().get_nodes_in_group("Pages").size() -2)
	
	#page_1 location
	var rand1 = randi() % 3
	if rand1 == 0:
		pass
	if rand1 == 1:
		page.position = Vector3(87.156, 0.0, 39.7)
		page.rotation = Vector3(0.0, -1.5, 0.0)
	if rand1 == 2:
		page.position = Vector3(-95.107, 0.0, 46.648)
		page.rotation = Vector3(0.0, -1.4 , 0.0)
		
	
	#page_2 location 
	var rand2 = randi() % 7
	if rand2 == 0:
		page_2.position = Vector3(114.241, 0.0, 40.926)
		page_2.rotation = Vector3(0.0, 3.05, 0.0)
		
	if rand2 == 1:
		page_2.position = Vector3(108.174, 0.0, 45.298)
		page_2.rotation = Vector3(0.0, -0.15, 0.0)
		
	if rand2 == 2:
		page_2.position = Vector3(-108.174, 0.0, 40.826)
		page_2.rotation = Vector3(0.0, 3.05, 0.0)
		
	if rand2 == 3:
		page_2.position = Vector3(-114.241, 0.0, 45.298)
		page_2.rotation = Vector3(0.0, -0.15, 0.0)
	if rand2 == 4:
		page_2.position = Vector3(-33.924, 0.0, 36.9)
		page_2.rotation = Vector3(0.0, 1.55, 0.0)
	if rand2 == 5:
		page_2.position = Vector3(33.824, 0.0, 36.9)
		page_2.rotation = Vector3(0.0, -1.55, 0.0)
		
	if rand2 == 6:
		pass
	
	#page_3 location
	var rand3 = randi() % 8
	if rand3 == 0:
		page_3.position = Vector3(-153.783, 0.087, 32.587)
		page_3.rotation = Vector3(-0.55, -2.57, 0.05)
	if rand3 == 1:
		page_3.position = Vector3(-144.517, 0, 45.169)
	if rand3 == 2:
		page_3.position = Vector3(156.11, 0, 19.046)
	if rand3 == 3:
		page_3.position = Vector3(158.633, 0, 48.57)
		page_3.rotation = Vector3(0, 3.1, 0)
	if rand3 == 4:
		page_3.position = Vector3(53.846, 0, 16.935)
		page_3.rotation = Vector3(0, -1.55, 0)
	if rand3 == 5:
		page_3.position = Vector3(24.156, 0.21, 7.077)
		page_3.rotation = Vector3(0, 1.55, 0)
	if rand3 == 6:
		page_3.position = Vector3(-29.33, -0.278, 12.377)
		page_3.rotation = Vector3(0, 2.55, 0)
	if rand3 == 7:
		pass
	
	#page_4 location
	var rand4 = randi() % 7
	if rand4 == 0:
		page_4.position = Vector3(9.147, 0, 30.835)
		page_4.rotation = Vector3(0, 3.1, 0)
		
	if rand4 == 1:
		page_4.position = Vector3(-11.566, -0.33, 24.676)
		page_4.rotation = Vector3(-1.55, -1.2, 0)
		
	if rand4 == 2:
		page_4.position = Vector3(-2.359, 0, 18.245)
		page_4.rotation = Vector3(0, -1.55, 0)
		
	if rand4 == 3:
		page_4.position = Vector3(17.16, 0, 15.547)
		page_4.rotation = Vector3(0, -1.57, 0)
		
	if rand4 == 4:
		page_4.position = Vector3(-0.431, 0, 12.837)
		page_4.rotation = Vector3(0, 3.1, 0)
		
	if rand4 == 5:
		page_4.position = Vector3(-9.924, 0, -5.012)
		page_4.rotation = Vector3(-0.13, 0, 0)
	if rand4 == 6:
		pass
	
	#page_5 location
	var rand5 = randi() % 6
	if rand5 == 0:
		page_5.position = Vector3(-17.301, 0, 37.85)
		page_5.rotation = Vector3(0, 3.1, 0)
	if rand5 == 1:
		page_5.position = Vector3(13.483, 0, 34.887)
		page_5.rotation = Vector3(0, 1.52, 0)
	if rand5 == 2:
		page_5.position = Vector3(84.578, 0, 51.401)
		page_5.rotation = Vector3(0, 1.52, 0)
	if rand5 == 3:
		page_5.position = Vector3(94.676, 0, 48.181)
		page_5.rotation = Vector3(0, -1.59, 0)
	if rand5 == 4:
		page_5.position = Vector3(-83.661, 0, 40.642)
		page_5.rotation = Vector3(0, 1.55, 0)
	if rand5 == 5:
		pass
	
	#page_6 location
	var rand6 = randi() % 8
	if rand6 == 0:
		page_6.position = Vector3(-41.702, 0, 45.851)
		page_6.rotation = Vector3(0, -3.1, 0)
		
	if rand6 == 1:
		page_6.position = Vector3(-37.208, 0, 50.712)
		page_6.rotation = Vector3(0, -1.55, 0)
		
	if rand6 == 2:
		page_6.position = Vector3(46.746, 0,47.7)
		page_6.rotation = Vector3(0, -1.57, 0)
		
	if rand6 == 3:
		page_6.position = Vector3(36.155, 0, 48.118)
		page_6.rotation = Vector3(0, 1.55, 0)
		
	if rand6 == 4:
		page_6.position = Vector3(83.34, 0, 32.165)
		page_6.rotation = Vector3(0, 0.05, 0)
		
	if rand6 == 5:
		page_6.position = Vector3(82.751, 0, 40.562)
		page_6.rotation = Vector3(0, 1.46, 0)
		
	if rand6 == 6:
		page_6.position = Vector3(-85.771, 0, 45.549)
		page_6.rotation = Vector3(0, 1.55, 0)
		
	if rand6 == 7:
		pass
	
	#page_7 location
	var rand7 = randi() % 9
	if rand7 == 0:
		page_7.position = Vector3(-36.285, 0, 78.737)
		page_7.rotation = Vector3(0, -3.1, 0)
		
	if rand7 == 1:
		page_7.position = Vector3(-28.401, 0, 66.597)
		page_7.rotation = Vector3(0, -2.65, 0)
		
	if rand7 == 2:
		page_7.position = Vector3(-21.424, 0, 72.939)
		page_7.rotation = Vector3(0, -3.1, 0)
		
	if rand7 == 3:
		page_7.position = Vector3(-9.883, 0, 66.295)
		page_7.rotation = Vector3(0, -0.18, 0)
		
	if rand7 == 4:
		page_7.position = Vector3(21.452, -0.54, 62.837)
		page_7.rotation = Vector3(-1.55, 1.55, 0)
		
	if rand7 == 5:
		page_7.position = Vector3(34.138, -0.661, 67.867)
		page_7.rotation = Vector3(-1.55, 0, 0)
		
	if rand7 == 6:
		page_7.position = Vector3(40.86, -0.47, 77.574)
		page_7.rotation = Vector3(-1.55, -2.2, 0)
		
	if rand7 == 7:
		page_7.position = Vector3(13.535, 0, 54.838)
		page_7.rotation = Vector3(0, -3.1, 0)
		
	if rand7 == 8:
		pass
	
	
	#page_8 location
	var rand8 = randi() % 4
	if rand8 == 0:
		page_8.position = Vector3(-126.156, 0, 47.411)
		page_8.rotation = Vector3(0, -1.55, 0)
		
	if rand8 == 1:
		page_8.position = Vector3(-40.599, -0.586, 37.695)
		page_8.rotation = Vector3(-1.55, 0.1, 0)
		
	if rand8 == 2:
		page_8.position = Vector3(37.022, -0.445, 37.695)
		page_8.rotation = Vector3(-1.55, 1.48, 0)
		
	if rand8 == 3:
		page_8.position = Vector3(137.845, 0, 39.585)
		page_8.rotation = Vector3(0, -1.55, 0)
		
	
	
	#page_9 location
	var rand9 = randi() % 5
	if rand9 == 0:
		page_9.position = Vector3(-131.058, -0.539, 15.424)
		page_9.rotation = Vector3(-1.55, 1.55, 0)
		
	if rand9 == 1:
		page_9.position = Vector3(-104.065, 0, 15.987)
		page_9.rotation = Vector3(0, 1.53, 0)
		
	if rand9 == 2:
		page_9.position = Vector3(-80.018, -0.665, 11.421)
		page_9.rotation = Vector3(-1.55, -0.25, 0)
		
	if rand9 == 3:
		page_9.position = Vector3(86.848, 0, 16.609)
		page_9.rotation = Vector3(0, -1.55, 0)
		
	if rand9 == 4:
		page_9.position = Vector3(106.079, 0, 16.66)
		page_9.rotation = Vector3(0, 2.83, 0)
		
	if rand9 == 5:
		pass
	
	
	#page_10 location
	var rand10 = randi() % 8
	if rand10 == 0:
		page_10.position = Vector3(-122.504, 0, 72.942)
		page_10.rotation = Vector3(0, 0, 0)
	if rand10 == 1:
		page_10.position = Vector3(-102.154, 0, 68.714)
		page_10.rotation = Vector3(0, 1.55, 0)
		
	if rand10 == 2:
		page_10.position = Vector3(-97.211, 0, 61.144)
		page_10.rotation = Vector3(0, 0, 0)
	if rand10 == 3:
		page_10.position = Vector3(-80.091, -0.659, 66.794)
		page_10.rotation = Vector3(-1.55, -2.3, 0)
		
	if rand10 == 4:
		page_10.position = Vector3(85.939, -0.529, 71.971)
		page_10.rotation = Vector3(-1.55, -3, 0)
		
	if rand10 == 5:
		page_10.position = Vector3(90.945, 0, 69.842)
		page_10.rotation = Vector3(0, -1.5, 0)
		
	if rand10 == 6:
		page_10.position = Vector3(111.458, -0.529, 61.894)
		page_10.rotation = Vector3(-1.55, -0.74, 0)
		
	if rand10 == 7:
		pass
	
	
	#2 Pages get deleted
	var random1 = get_tree().get_nodes_in_group("Pages").pick_random()
	var random2 = get_tree().get_nodes_in_group("Pages").pick_random()
	
	while random1 == random2:
		random2 = get_tree().get_nodes_in_group("Pages").pick_random()
	
	random1.queue_free()
	random2.queue_free()


func _process(delta):
	get_tree().call_group("Stalker", "update_target_location", player.global_transform.origin)

	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()
	
	if Autoloads.collected_collectibles == 1 and viz == true:
		stalker_2.visible = true
		stalker_2.process_mode = Node.PROCESS_MODE_INHERIT
		viz = false
	
	if Autoloads.collected_collectibles == 8:
		get_tree().change_scene_to_file("res://Levels/Level_2/Wins_2.tscn")

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
