extends RigidBody2D

var direction := Vector2(0, 0)
var speed := 800
var jump_strength := 600

var is_up := false
var up_strength := 200

@onready var particles := $GPUParticles2D

func _process(delta):
	direction = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		0
	).normalized()
	if Input.is_action_just_pressed("ui_up"):
		apply_impulse(Vector2(0, -jump_strength))
		particles.emitting = true
	if Input.is_action_pressed("ui_up"):
		particles.emitting = true
		is_up = true
	else:
		particles.emitting = false
		is_up = false
		up_strength = 200
	
func _physics_process(delta):
	apply_force(direction * speed)
	if is_up:
		up_strength += 10
		up_strength = min(2000, up_strength)
		print(up_strength)
		apply_force(Vector2(0, -up_strength))
