extends Node3D

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_2/level_2.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
