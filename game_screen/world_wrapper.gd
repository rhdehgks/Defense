extends Node2D

@onready var _screen_size := get_viewport_rect().size



func _draw():
	for x in range(-1, 2):
		for y in range(-1, 2):
			if x != 0 or y != 0:
				draw_texture(get_viewport().get_texture(), _screen_size * Vector2(x, y))
