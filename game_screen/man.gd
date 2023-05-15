extends RigidBody2D

@onready var timer := $Timer
@onready var screen_size := get_viewport_rect().size

func _ready():
	timer.wait_time = randf_range(1, 2)
	timer.start()
	
func _physics_process(delta):
	_screen_wrap()

func _on_timer_timeout():
	apply_impulse(_get_random_direction() * 100)
	timer.wait_time = randf_range(1, 2)

func _get_random_direction():
	return Vector2(randf_range(-1, 1), randf_range(-1, 1)).normalized()

func _screen_wrap():
	if global_position.x > screen_size.x:
		global_position.x = 0
	if global_position.x < 0:
		global_position.x = screen_size.x
	if global_position.y > screen_size.y:
		global_position.y = 0
	if global_position.y < 0:
		global_position.y = screen_size.y
