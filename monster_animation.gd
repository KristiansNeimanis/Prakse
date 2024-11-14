extends Node3D
@onready var nav = $"../NavigationAgent3D"
@onready var animation_player = $AnimationPlayer
@onready var sprite = $Sketchfab_model/ce6a336ac9b348a6ab14975772090f1b_fbx/Object_2/RootNode/Object_4/Skeleton3D/BoneAttachment3D2/Sprite3D
@onready var timer = $"../Timer"

var flip = false
func _process(delta):
	var next_location = nav.get_next_path_position()
	self.look_at(next_location)
	if animation_player.animation_finished:
		animation_player.play("anim")

func _ready():
	timer.wait_time = 0.25
	timer.start()
	animation_player.play("anim")

func _on_timer_timeout():
	if flip == false:
		flip = true
		sprite.flip_v = flip
		sprite.rotation = Vector3(0, 0, 0.1)
	else:
		flip = false
		sprite.flip_v = flip
		sprite.rotation = Vector3(0, 0, -0.1)
	timer.start()
