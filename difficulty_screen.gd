class_name Difficulty
extends Node3D

@onready var normal_checkbox = $Control/normal
@onready var hard_checkbox = $Control/hard
@onready var easy_checkbox = $Control/easy

@onready var description = $Control/Description

var n = true
var h = false
var e = false

var normal
var hard
var easy

func _on_normal_pressed():
	description.text = "Normal Difficulty:
		
		Monster speed is average.
		Item spawn frequency is average."
	
	hard_checkbox.button_pressed = false
	easy_checkbox.button_pressed = false
	
	n = true
	h = false
	e = false


func _on_hard_pressed():
	description.text = "Hard Difficulty:
		
		Monster speed is as fast as the players walking speed from the start.
		Item spawn frequency is lower than average."
	normal_checkbox.button_pressed = false
	easy_checkbox.button_pressed = false
	
	h = true
	n = false
	e = false


func _on_easy_pressed():
	description.text = "Easy Difficulty:
		
		Monster speed will not surpass the players walking speed.
		Item spawn frequency is slightly higher than average."
	normal_checkbox.button_pressed = false
	hard_checkbox.button_pressed = false
	
	e = true
	h = false
	n = false

func _on_back_pressed():
	get_tree().change_scene_to_file("res://menu.tscn")
