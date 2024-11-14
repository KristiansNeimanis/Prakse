extends ColorRect

@export var target : NodePath
@export var camera_distance := 50.0

@onready var player := get_node(target)
@onready var camera := $SubViewportContainer/SubViewport/Camera3D
@onready var mini_map = $"."

@onready var spot = $SubViewportContainer/SubViewport/Camera3D/SpotLight3D
@onready var map = $map

func _process(delta):
	if target:
		camera.size = camera_distance
		camera.position = Vector3(player.position.x, camera_distance, player.position.z)
	
	if Input.is_action_pressed("pause"):
		mini_map.show()
		spot.show()
		map.show()
	if Input.is_action_just_released("pause"):
		mini_map.hide()
		spot.hide()
		map.hide()
