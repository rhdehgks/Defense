extends RigidBody2D

var speed := 800
var strength := 400

var follow_intensity := 10
var rotation_intensity := 30

@onready var astroneer: RigidBody2D = $"/root/Game".find_child("Astroneer")
@onready var screen_wrapper: ScreenWrapper = $"ScreenWrapper"
	
func _physics_process(delta):
	_follow(astroneer, Vector2(0, -32 * 5), follow_intensity)
	_keep_angle(0, rotation_intensity)
			
func _follow(target: Node2D, offset: Vector2, intensity: float):
	var target_position
	if screen_wrapper:
		target_position = screen_wrapper.get_wrapped_position(target.global_position + offset)
	else:
		target_position = target.global_position + offset
	var direction_to_target = global_position.direction_to(target_position)
	var distance_to_target = global_position.distance_to(target_position)
	apply_force(direction_to_target * distance_to_target * intensity)
	
func _keep_angle(angle: float, intensity: float):
	var angle_difference = fmod(angle - self.rotation, PI * 2)
	if angle_difference > PI:
		angle_difference -= PI * 2
	elif angle_difference < -PI:
		angle_difference += PI * 2
	apply_torque_impulse(angle_difference * intensity)
