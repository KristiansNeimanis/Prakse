class_name Inventory
extends Node3D

@onready var icon_1 = $Slot_1/MarginContainer/TextureRect
@onready var icon_2 = $Slot_2/MarginContainer/TextureRect
@onready var icon_3 = $Slot_3/MarginContainer/TextureRect

@onready var outline_1 = $Slot_1/ColorRect
@onready var outline_2 = $Slot_2/ColorRect
@onready var outline_3 = $Slot_3/ColorRect

@onready var ray_cast_3d = $"../../Head/Camera3D/RayCast3D"
@onready var ui = $".."

var s1 = true
var s2 = false
var s3 = false

@onready var name_1 = $name_1
@onready var name_2 = $name_2
@onready var name_3 = $name_3

func _process(delta):
	interaction_step()
	
	if Input.is_action_just_pressed("slot_1"):
		name_2.visible = false
		name_3.visible = false
		s2 = false
		s3 = false
		outline_2.visible = false
		outline_3.visible = false
		
		outline_1.visible = true
		s1 = true
		name_1.visible = true
	
	if Input.is_action_just_pressed("slot_2"):
		name_1.visible = false
		name_3.visible = false
		s1 = false
		s3 = false
		outline_1.visible = false
		outline_3.visible = false
		
		outline_2.visible = true
		s2 = true
		name_2.visible = true
	
	if Input.is_action_just_pressed("slot_3"):
		name_1.visible = false
		name_2.visible = false
		s1 = false
		s2 = false
		outline_1.visible = false
		outline_2.visible = false
		
		outline_3.visible = true
		s3 = true
		name_3.visible = true

func interaction_step():
	var raycast_colider = ray_cast_3d.get_collider()
	
	if raycast_colider and raycast_colider is Interactable:
		
		ui.set_interaction_text_visible(true)
		ui.set_interaction_label_text(raycast_colider.interaction_prompt_text)
		
		if Input.is_action_just_pressed("interact"):
			raycast_colider.interacted_with()
	elif raycast_colider and raycast_colider is Itemsss:
		
		ui.set_interaction_text_visible(true)
		ui.set_interaction_label_text(raycast_colider.interaction_prompt_text_item)
		
		ui.set_description_text_visible(true)
		ui.set_description_label_text(raycast_colider.item_description)
		
		
		if Input.is_action_just_pressed("interact"):
			raycast_colider.interacted_with_item()
			if(s1):
				ui.set_slot1_image(raycast_colider.item_icon)
				ui.set_slot1_name(raycast_colider.item_name)
			if(s2):
				ui.set_slot2_image(raycast_colider.item_icon)
				ui.set_slot2_name(raycast_colider.item_name)
			if(s3):
				ui.set_slot3_image(raycast_colider.item_icon)
				ui.set_slot3_name(raycast_colider.item_name)
	else:
		ui.set_interaction_text_visible(false)
		ui.set_description_text_visible(false)
