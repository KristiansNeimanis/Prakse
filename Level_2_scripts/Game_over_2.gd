extends Node3D
@onready var collected = $Collected
@onready var animationplayer = $CanvasLayer/AnimationPlayer
@onready var canvas_layer = $CanvasLayer
@onready var light = $Light

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	collected.text = "Total pages collected " + str(Autoloads.collected_collectibles)
	animationplayer.play("death")
	await Signal(animationplayer, "animation_finished")
	light.play("Light")
	canvas_layer.queue_free()

func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")

func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_2/level_2.tscn")
