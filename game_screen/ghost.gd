extends RigidBody2D

@onready var timer := $Timer

func _ready():
	timer.wait_time = randf_range(1, 2)
	timer.start()
	
func _on_timer_timeout():
	apply_impulse(_get_random_direction() * 100)
	timer.wait_time = randf_range(1, 2)

func _get_random_direction():
	return Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()
