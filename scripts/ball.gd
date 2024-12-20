extends RigidBody2D

@export var initial_speed: float = 300.0
var velocity: Vector2

func _ready():
	# Set the initial velocity for the ball
	velocity = Vector2(initial_speed, initial_speed).rotated(randf() * TAU)

func _physics_process(delta):
	# Move the ball
	var collision: KinematicCollision2D = move_and_collide(velocity * delta)
	
	if collision == null:
		return
	
	var collider = collision.get_collider()
	var to: Vector2 = collision.get_normal()
	
	if collider.name == "platform":
		to = (position - collider.position).normalized()
		to = to.from_angle(PI/2)
		
	# Reflect the velocity upon collision
	velocity = velocity.bounce(to)

	# If you want to adjust velocity mid-game:
	#if Input.is_action_just_pressed("restart_ball"):
		#reset_ball()
	pass
	
func reset_ball():
	global_position = Vector2(400, 300)  # Replace with your starting position
	velocity = Vector2(initial_speed, initial_speed).rotated(randf() * TAU)
