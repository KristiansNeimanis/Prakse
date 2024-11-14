extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_again_pressed():
	LoadsManager.load_scene("res://Levels/Level_1/node_3d.tscn")


func _on_menu_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
