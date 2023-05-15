extends RigidBody2D

var direction := Vector2(0, 0)
var speed := 800
var strength := 400


func _process(delta):
	direction = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	).normalized()
	
func _physics_process(delta):
	apply_force(direction * speed)
	
func _input(event):
	if event is InputEventScreenTouch:
		if event.is_pressed():
			direction = (get_global_mouse_position() - global_position).normalized()
			apply_impulse(direction * strength)
