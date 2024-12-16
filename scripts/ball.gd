extends RigidBody2D

@export var initial_speed: float = 300.0
var velocity: Vector2

func _ready():
	# Set the initial velocity for the ball
	velocity = Vector2(initial_speed, initial_speed).rotated(randf() * TAU)

func _physics_process(delta):
	# Move the ball
	var collision = move_and_collide(velocity * delta)
	if collision:
		# Reflect the velocity upon collision
		velocity = velocity.bounce(collision.get_normal())

	# If you want to adjust velocity mid-game:
	#if Input.is_action_just_pressed("restart_ball"):
		#reset_ball()

func reset_ball():
	global_position = Vector2(400, 300)  # Replace with your starting position
	velocity = Vector2(initial_speed, initial_speed).rotated(randf() * TAU)
