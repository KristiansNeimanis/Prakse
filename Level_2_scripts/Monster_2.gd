extends CharacterBody3D

@onready var audio = $AudioStreamPlayer3D

@onready var nav: NavigationAgent3D = $NavigationAgent3D
@onready var death_screen = $Head/Camera3D/Death_screen

var SPEED = 2.5

var page_2 = true
var page_4 = true
var page_5 = true
var page_6 = true
var page_7 = true

var in_zone = false

func _physics_process(delta):
	if Autoloads.collected_collectibles == 2 and page_2 == true:
		SPEED += 0.3
		page_2 = false
	if Autoloads.collected_collectibles == 4 and page_4 == true:
		SPEED += 0.1
		page_4 = false
	if Autoloads.collected_collectibles == 5 and page_5 == true:
		SPEED += 0.2
		page_5 = false
	if Autoloads.collected_collectibles == 6 and page_6 == true:
		SPEED += 0.1
		page_6 = false
	if Autoloads.collected_collectibles == 7 and page_7 == true:
		SPEED += 0.2
		page_7 = false
	var current_location = global_transform.origin
	var next_location = nav.get_next_path_position()
	var new_velocity = (next_location - current_location).normalized() * SPEED
	
	velocity = velocity.move_toward(new_velocity, .25)
	move_and_slide()

func update_target_location(target_location):
	nav.target_position = target_location

func _on_navigation_agent_3d_target_reached():
	get_tree().change_scene_to_file("res://Levels/Level_2/Game_over_2.tscn")


func _on_area_3d_body_entered(body):
	if(body.name == "Player"):
		print(".......")
		print("player entered the zone")
		print(".......")
		
		in_zone = true


func _on_area_3d_body_exited(body):
	if(body.name == "Player"):
		print(".......")
		print("player left the zone")
		print(".......")
		
		in_zone = false
