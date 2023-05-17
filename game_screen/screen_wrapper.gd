extends Node2D

class_name ScreenWrapper

@onready var _screen_size := get_viewport_rect().size
@onready var _parent := $".."

func _physics_process(delta):
	_screen_wrap()

func _screen_wrap():
	_parent.global_position.x = fmod(_parent.global_position.x + _screen_size.x, _screen_size.x)
	_parent.global_position.y = fmod(_parent.global_position.y + _screen_size.y, _screen_size.y)

func get_wrapped_position(position: Vector2) -> Vector2:
	var wrapped_position := position
	if abs(position.x - _parent.global_position.x) > _screen_size.x / 2:
		if position.x > _parent.global_position.x:
			wrapped_position.x = position.x - _screen_size.x
		else:
			wrapped_position.x = position.x + _screen_size.x
	if abs(position.y - _parent.global_position.y) > _screen_size.y / 2:
		if position.y > _parent.global_position.y:
			wrapped_position.y = position.y - _screen_size.y
		else:
			wrapped_position.y = position.y + _screen_size.y
	return wrapped_position
