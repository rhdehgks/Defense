extends RigidBody2D

var direction := Vector2(0, 0)
var speed := 800
var jump_strength := 400

func _process(delta):
	direction = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		0
	).normalized()
	if Input.is_action_just_pressed("ui_up"):
		apply_impulse(Vector2(0, -jump_strength))
	
func _physics_process(delta):
	apply_force(direction * speed)
