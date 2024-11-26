extends CanvasLayer

@onready var level_2 = $".."


func _on_resume_pressed():
	level_2.pauseMenu()


func _on_go_menu_pressed():
	get_tree().paused = false
	get_tree().change_scene_to_file("res://menu.tscn")
