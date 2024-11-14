extends Node3D

@export var footstep_sounds1 : Array[AudioStreamMP3]
@export var footstep_sounds2 : Array[AudioStreamMP3]
@export var footstep_sounds3 : Array[AudioStreamMP3]
@export var footstep_sounds4 : Array[AudioStreamMP3]

@export var ground_pos : Marker3D

@onready var player : CharacterBody3D = get_parent()
@onready var detector = $"../Head/Floor_Detector"

var floor_1 = false
var floor_2 = false
var ground = false
var path = false

var collider

func _ready() -> void:
	player.step.connect(play_sound)
	

func play_sound():
	if detector.is_colliding():
		collider = detector.get_collider()
		if collider is Node3D or StaticBody3D:
			var collider_node = collider as Node3D
			if collider_node.is_in_group("Floor_1"):
				floor_1 = true
			else:
				floor_1 = false
				
			if collider_node.is_in_group("Floor_2"):
				floor_2 = true
			else:
				floor_2 = false
				
			if collider_node.is_in_group("Ground"):
				ground = true
			else:
				ground = false
				
			if collider_node.is_in_group("Path"):
				path = true
			else:
				path = false
		else:
			floor_2 = false
			floor_1 = false
			ground = false
			path = false
	
	
	var audio_player : AudioStreamPlayer3D = AudioStreamPlayer3D.new()
	audio_player.area_mask = 1
	if floor_1 == true:
		var random_index : int = randi_range(0,footstep_sounds2.size() - 1)
		audio_player.stream = footstep_sounds2[random_index]
		audio_player.pitch_scale = randf_range(0.6,0.8)
		ground_pos.add_child(audio_player)
		audio_player.play()
		audio_player.finished.connect(func destroy(): audio_player.queue_free())
	if floor_2 == true:
		var random_index : int = randi_range(0,footstep_sounds3.size() - 1)
		audio_player.stream = footstep_sounds3[random_index]
		audio_player.pitch_scale = randf_range(0.7,0.9)
		ground_pos.add_child(audio_player)
		audio_player.play()
		audio_player.finished.connect(func destroy(): audio_player.queue_free())
	if ground == true:
		var random_index : int = randi_range(0,footstep_sounds1.size() - 1)
		audio_player.stream = footstep_sounds1[random_index]
		audio_player.pitch_scale = randf_range(0.7,0.9)
		ground_pos.add_child(audio_player)
		audio_player.play()
		audio_player.finished.connect(func destroy(): audio_player.queue_free())
	if path == true:
		var random_index : int = randi_range(0,footstep_sounds4.size() - 1)
		audio_player.stream = footstep_sounds4[random_index]
		audio_player.pitch_scale = randf_range(0.7,0.9)
		ground_pos.add_child(audio_player)
		audio_player.play()
		audio_player.finished.connect(func destroy(): audio_player.queue_free())
