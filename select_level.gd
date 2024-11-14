extends Node3D



func _on_level_1b_pressed():
	LoadsManager.load_scene("res://Levels/Level_1/node_3d.tscn")


func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")


func _on_level_2b_pressed():
	LoadsManager.load_scene("res://Levels/Level_2/level_2.tscn")
