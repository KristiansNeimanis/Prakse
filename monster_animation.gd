extends Node3D
@onready var nav = $"../NavigationAgent3D"
@onready var animation_player = $AnimationPlayer


func _process(delta):
	var next_location = nav.get_next_path_position()
	self.look_at(next_location)
	if animation_player.animation_finished:
		animation_player.play("anim")

func _ready():
	animation_player.play("anim")
