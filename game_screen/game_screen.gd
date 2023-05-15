extends Control

@onready var fps_label := $FPSLabel

func _ready():
	if size != get_viewport_rect().size:
		size = get_viewport_rect().size
	
func _process(delta):
	fps_label.text = "FPS: " + str(Engine.get_frames_per_second())
