extends Node3D


# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_play_button_pressed():
	get_tree().change_scene_to_file("res://select_level.tscn")


func _on_controls_button_pressed():
	get_tree().change_scene_to_file("res://controls.tscn")


func _on_quit_pressed():
	get_tree().quit()


func _on_stats_button_pressed():
	get_tree().change_scene_to_file("res://stats_scene.tscn")


func _on_settings_pressed():
	get_tree().change_scene_to_file("res://settings_screen.tscn")
