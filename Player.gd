extends CharacterBody3D

#movement
const WALK_SPEED = 3.0
const SPRINT_SPEED = 5.0
var SPEED = WALK_SPEED
const SENSITIVITY = 0.003

@onready var stamina = $Head/Camera3D/TextureProgressBar

var is_running = false
var STAMINA = 100
var max = 100
#head bob
const BOB_FREQ = 1.6
const BOB_AMP = 0.13
var t_bob = 0.0

var can_play : bool = true
signal step

@onready var breath = $breath

#shortcut
@onready var ray_cast_3d = $Head/Camera3D/RayCast3D
@onready var ui = $UI

@onready var flashlight = $Head/Camera3D/Flashlight/SpotLight3D


@onready var head := $Head
@onready var camera := $Head/Camera3D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _unhandled_input(event):
	if event is InputEventMouseMotion:
		head.rotate_y(-event.relative.x * SENSITIVITY)
		camera.rotate_x(-event.relative.y * SENSITIVITY)
		camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-55), deg_to_rad(45))

func _physics_process(delta):
	
	interaction_step()
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	stamina.value = STAMINA
	
	if Input.is_action_pressed("move_run") and STAMINA > 0:
		is_running = true
		SPEED = SPRINT_SPEED
		STAMINA -= 0.25
		if STAMINA <= 0:
			SPEED = WALK_SPEED
			is_running = false
	

	if Input.is_action_just_released("move_run"):
		SPEED = WALK_SPEED
		is_running = false
	
	if is_running == false:
		if STAMINA < max:
			STAMINA += 0.15
		
	
	if Input.is_action_just_pressed("flashlight"):
		if flashlight.visible:
			flashlight.visible = false
		else:
			flashlight.visible = true
	
	flashlight.spot_angle = clamp(flashlight.spot_angle, 25, 45)
	flashlight.light_energy = clamp(flashlight.light_energy, 1.2, 3.2)
	flashlight.spot_range = clamp(flashlight.spot_range, 25, 45)
		
	if Input.is_action_just_pressed("scroll_down"):
		flashlight.spot_angle += 1.0
		flashlight.light_energy -= 0.1
		flashlight.spot_range -= 0.1
		
		
		
	if Input.is_action_just_pressed("scroll_up"):
		flashlight.spot_angle -= 1.0
		flashlight.light_energy += 0.1
		flashlight.spot_range += 0.1

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backwards")
	var direction = (head.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = 0.0
		velocity.z = 0.0
	
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	#head bob
	t_bob += delta * velocity.length() * float(is_on_floor())
	camera.transform.origin = _headbob(t_bob)
	
	move_and_slide()

func interaction_step():
	var raycast_colider = ray_cast_3d.get_collider()
	
	if raycast_colider and raycast_colider is Interactable:
		
		ui.set_interaction_text_visible(true)
		ui.set_interaction_label_text(raycast_colider.interaction_prompt_text)
		
		if Input.is_action_just_pressed("interact"):
			raycast_colider.interacted_with()
		
	else:
		ui.set_interaction_text_visible(false)

func _headbob(time) -> Vector3:
	var pos = Vector3.ZERO
	pos.y = sin(time * BOB_FREQ) * BOB_AMP
	pos.x = cos(time * BOB_FREQ / 2) * BOB_AMP
	
	var low_pos  = BOB_AMP - 0.05
	if pos.y > -low_pos:
		can_play = true
	
	if pos.y < -low_pos and can_play:
		can_play = false
		emit_signal("step")
		
	return pos
