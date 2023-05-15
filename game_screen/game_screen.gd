extends Control

func _ready():
	size = get_viewport_rect().size
	
func _process(delta):
	if size != get_viewport_rect().size:
		size = get_viewport_rect().size
