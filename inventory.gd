extends Control

@onready var slot_1 = $Slot_1
@onready var slot_2 = $Slot_2
@onready var slot_3 = $Slot_3

@onready var icon_1 = $Slot_1/MarginContainer/TextureRect
@onready var icon_2 = $Slot_2/MarginContainer/TextureRect
@onready var icon_3 = $Slot_3/MarginContainer/TextureRect

@onready var outline_1 = $Slot_1/ColorRect
@onready var outline_2 = $Slot_2/ColorRect
@onready var outline_3 = $Slot_3/ColorRect


var s1 = true
var s2 = false
var s3 = false


func _process(delta):
	if Input.is_action_just_pressed("slot_1"):
		outline_1.visible = true
		s1 = true
		
		s2 = false
		s3 = false
		outline_2.visible = false
		outline_3.visible = false
	
	if Input.is_action_just_pressed("slot_2"):
		outline_2.visible = true
		s2 = true
		
		s1 = false
		s3 = false
		outline_1.visible = false
		outline_3.visible = false
	
	if Input.is_action_just_pressed("slot_3"):
		outline_3.visible = true
		s3 = true
		
		s1 = false
		s2 = false
		outline_1.visible = false
		outline_2.visible = false
