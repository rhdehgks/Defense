extends RigidBody2D

var direction := Vector2(0, 0)
var speed := 800


func _process(delta):
	direction = Vector2(
		int(Input.is_action_pressed("ui_right")) - int(Input.is_action_pressed("ui_left")),
		int(Input.is_action_pressed("ui_down")) - int(Input.is_action_pressed("ui_up"))
	).normalized()
	
func _physics_process(delta):
	apply_force(direction * speed)
