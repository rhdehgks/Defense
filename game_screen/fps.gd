extends RigidBody2D

@onready var screen_size := get_viewport_rect().size

func _physics_process(delta):
	_screen_wrap()

func _screen_wrap():
	if global_position.x > screen_size.x:
		global_position.x = 0
	if global_position.x < 0:
		global_position.x = screen_size.x
	if global_position.y > screen_size.y:
		global_position.y = 0
	if global_position.y < 0:
		global_position.y = screen_size.y
