extends Control

func _ready():
	if size != get_viewport_rect().size:
		size = get_viewport_rect().size
	
