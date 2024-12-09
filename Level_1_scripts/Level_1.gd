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

var page4 = true
var page5 = true
var page6 = true
var page7 = true

@onready var page_1 = $Pages/Page
@onready var page_2 = $Pages/Page2
@onready var page_3 = $Pages/Page3
@onready var page_4 = $Pages/Page4
@onready var page_5 = $Pages/Page5
@onready var page_6 = $Pages/Page6
@onready var page_7 = $Pages/Page7
@onready var page_8 = $Pages/Page8
@onready var page_9 = $Pages/Page9
@onready var page_10 = $Pages/Page10

var timer_stoped = true

var already_in_zone = false

@onready var mon_cast = $TestPlayer/Head/Camera3D/MonCast
@onready var mon_cast_2 = $TestPlayer/Head/Camera3D/MonCast2
@onready var mon_cast_3 = $TestPlayer/Head/Camera3D/MonCast3
@onready var mon_cast_4 = $TestPlayer/Head/Camera3D/MonCast4
@onready var mon_cast_5 = $TestPlayer/Head/Camera3D/MonCast5

@onready var screen_effect = $CanvasLayer2/ColorRect
@onready var static_sound = $Static_sound

var effect = 0.03

func _process(delta):
	if(mon_cast.is_colliding()):
		if(mon_cast.get_collider().name == "Stalker"):
			print("colider_1")
			effect += 0.001
			screen_effect.get_material().set_shader_parameter("noise_amount", effect)
			if(static_sound.volume_db < -10):
				static_sound.volume_db += 0.25
		else:
			if(effect <= 0.03):
				pass
			else:
				effect -= 0.0005
				screen_effect.get_material().set_shader_parameter("noise_amount", effect)
				static_sound.volume_db -= 0.125
	elif(mon_cast_2.is_colliding()):
		if(mon_cast_2.get_collider().name == "Stalker"):
			print("colider_2")
			effect += 0.001
			screen_effect.get_material().set_shader_parameter("noise_amount", effect)
			if(static_sound.volume_db < -10):
				static_sound.volume_db += 0.25
		else:
			if(effect <= 0.03):
				pass
			else:
				effect -= 0.0005
				screen_effect.get_material().set_shader_parameter("noise_amount", effect)
				static_sound.volume_db -= 0.125
	elif(mon_cast_3.is_colliding()):
		if(mon_cast_3.get_collider().name == "Stalker"):
			print("colider_3")
			effect += 0.001
			screen_effect.get_material().set_shader_parameter("noise_amount", effect)
			if(static_sound.volume_db < -10):
				static_sound.volume_db += 0.25
		else:
			if(effect <= 0.03):
				pass
			else:
				effect -= 0.0005
				screen_effect.get_material().set_shader_parameter("noise_amount", effect)
				static_sound.volume_db -= 0.125
	elif(mon_cast_4.is_colliding()):
		if(mon_cast_4.get_collider().name == "Stalker"):
			print("colider_4")
			effect += 0.001
			screen_effect.get_material().set_shader_parameter("noise_amount", effect)
			if(static_sound.volume_db < -10):
				static_sound.volume_db += 0.25
		else:
			if(effect <= 0.03):
				pass
			else:
				effect -= 0.0005
				screen_effect.get_material().set_shader_parameter("noise_amount", effect)
				static_sound.volume_db -= 0.125
	elif(mon_cast_5.is_colliding()):
		if(mon_cast_5.get_collider().name == "Stalker"):
			print("colider_5")
			effect += 0.001
			screen_effect.get_material().set_shader_parameter("noise_amount", effect)
			if(static_sound.volume_db < -10):
				static_sound.volume_db += 0.25
		else:
			if(effect <= 0.03):
				pass
			else:
				effect -= 0.0005
				screen_effect.get_material().set_shader_parameter("noise_amount", effect)
				static_sound.volume_db -= 0.125
	else:
		if(effect <= 0.03):
			pass
		else:
			effect -= 0.0005
			screen_effect.get_material().set_shader_parameter("noise_amount", effect)
			static_sound.volume_db -= 0.125
	
	if(screen_effect.get_material().get_shader_parameter("noise_amount") >= 0.4):
		get_tree().change_scene_to_file("res://Levels/Level_1/game_over.tscn")
	
	if(stalker.in_zone == true and already_in_zone == false):
		$flicker_timer.start()
		already_in_zone = true
	if(stalker.in_zone == false and already_in_zone == true):
		$flicker_timer.stop()
		already_in_zone = false

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
	if Autoloads.collected_collectibles == 4 and page4 == true:
		max_distance -= 1
		min_distance -= 1
		max_time -= 2
		min_time -= 1
		page4 = false
	if Autoloads.collected_collectibles == 5 and page5 == true:
		max_distance -= 1
		min_distance -= 1
		max_time -= 2
		min_time -= 1
		page5 = false
	if Autoloads.collected_collectibles == 6 and page6 == true:
		max_distance -= 1.5
		min_distance -= 1.5
		max_time -= 2
		min_time -= 1
		page6 = false
	if Autoloads.collected_collectibles == 7 and page7 == true:
		max_distance -= 3
		min_distance -= 3
		max_time -= 1
		min_time -= 1
		page7 = false
		
		

func _ready():
	screen_effect.get_material().set_shader_parameter("noise_amount", 0.03)
	
	stalker.visible = false
	stalker.process_mode = Node.PROCESS_MODE_DISABLED
	Autoloads.initialize_variables(0, get_tree().get_nodes_in_group("Pages").size() -2)
	var rand_p1 = get_tree().get_nodes_in_group("Pages").pick_random()
	var rand_p2 = get_tree().get_nodes_in_group("Pages").pick_random()
	
	while rand_p1 == rand_p2:
		rand_p2 = get_tree().get_nodes_in_group("Pages").pick_random()
	
	rand_p1.queue_free()
	rand_p2.queue_free()
	
	
	var rand1 = randi() % 4
	if rand1 == 0:
		page_1.position = Vector3(56.747, 0.677, 65.52)
		page_1.rotation = Vector3(0, -1.87, 0)
		
	if rand1 == 1:
		page_1.position = Vector3(52.547, 0.677, 58.692)
		page_1.rotation = Vector3(0, -0.3, 0)
		
	if rand1 == 2:
		page_1.position = Vector3(40.792, 0.677, 75.704)
		page_1.rotation = Vector3(0, -1.87, 0)
		
	if rand1 == 3:
		pass
	
	var rand2 = randi() % 4
	if rand2 == 0:
		page_2.position = Vector3(44.793, 0.57, 73.122)
		page_2.rotation = Vector3(0, -0.3, 0)
		
	if rand2 == 1:
		page_2.position = Vector3(53.314, 0.57, 65.155)
		page_2.rotation = Vector3(0, -0.25, 0)
		
	if rand2 == 2:
		page_2.position = Vector3(48.001, 0.57, 60.443)
		page_2.rotation = Vector3(0, -1.82, 0)
		
	if rand2 == 3:
		pass
	
	
	var rand3 = randi() % 4
	if rand3 == 0:
		page_3.position = Vector3(-49.338, 0.55, 49.883)
		page_3.rotation = Vector3(0.1, -0.52, -0.1)
		
	if rand3 == 1:
		page_3.position = Vector3(-47.205, 0.55, 66.872)
		page_3.rotation = Vector3(-0.1, -0.52, 0.1)
	
	if rand3 == 2:
		page_3.position = Vector3(-30.175, 0.55, 61.384)
		page_3.rotation = Vector3(0.1, -0.52, -0.1)
		
	if rand3 == 3:
		pass
	
	
	var rand4 = randi() % 4
	if rand4 == 0:
		page_4.position = Vector3(-67.951, -0.094, -24.55)
		page_4.rotation = Vector3(0, 0.75, 0)
		
	if rand4 == 1:
		page_4.position = Vector3(-57.846, -0.094, -27.564)
		page_4.rotation = Vector3(0, 1.82, 0)
		
	if rand4 == 2:
		page_4.position = Vector3(-60.836, -0.094, -18.299)
		page_4.rotation = Vector3(0, 1.3, 0)
		
	if rand4 == 3:
		pass
	
	
	var rand5 = randi() % 3
	if rand5 == 0:
		page_5.position = Vector3(-38, 0.924, -79.633)
		page_5.rotation = Vector3(0, -2.8, 0)
		
	if rand5 == 1:
		page_5.position = Vector3(-36.606, 0.924, -78.762)
		page_5.rotation = Vector3(0, 1.53, 0)
		
	if rand5 == 2:
		pass
	
	
	var rand6 = randi() % 3
	if rand6 == 0:
		page_6.position = Vector3(66.45, 0.85, -78.55)
		page_6.rotation = Vector3(0, 1.55, 0)
		
	if rand6 == 1:
		page_6.position = Vector3(56.545, 0.85, -64.874)
		page_6.rotation = Vector3(0, 1.55, 0)
		
	if rand6 == 2:
		pass
	
	
	var rand7 = randi() % 2
	if rand7 == 0:
		page_7.position = Vector3(-36.987, 0.835, 3.656)
		page_7.rotation = Vector3(0.2, 0.71, -0.1)
		
	if rand7 == 1:
		pass
	
	
	var rand8 = randi() % 4
	if rand8 == 0:
		page_8.position = Vector3(68.257, 0.765, 11.011)
		page_8.rotation = Vector3(0, -1.7, 0)
		
	if rand8 == 1:
		page_8.position = Vector3(69.245, 0.765, 7.026)
		page_8.rotation = Vector3(0, -1.7, 0)
		
	if rand8 == 2:
		page_8.position = Vector3(71.003, 0.765, 13.029)
		page_8.rotation = Vector3(0, -0.15, 0)
		
	if rand8 == 3:
		pass
	
	
	var rand9 = randi() % 4
	if rand9 == 0:
		page_9.position = Vector3(68.191, 0.765, 13.5)
		page_9.rotation = Vector3(0, 1.45, 0)
		
	if rand9 == 1:
		page_9.position = Vector3(74.404, 0.765, 13.897)
		page_9.rotation = Vector3(0, -0.1, 0)
		
	if rand9 == 2:
		page_9.position = Vector3(67.319, 0.765, 16.87)
		page_9.rotation = Vector3(0, 1.45, 0)
		
	if rand9 == 3:
		pass
	
	
	var rand10 = randi() % 3
	if rand10 == 0:
		page_10.position = Vector3(84.179, 1, -53.204)
		page_10.rotation = Vector3(0.1, -1.41, 0.05)
		
	if rand10 == 1:
		page_10.position = Vector3(84.105, 0.7, -75.775)
		page_10.rotation = Vector3(0.1, -1.82, 0.05)
		
	if rand10 == 2:
		pass

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


func _on_flicker_timer_timeout():
	var rand = randi() % 2
	if rand == 0:
		pass
	if rand == 1:
		if(player.light_on == true):
			player.flashlight.visible = false
			player.light_on = false
		else:
			player.flashlight.visible = true
			player.light_on = true
