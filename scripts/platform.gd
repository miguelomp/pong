extends Node2D

@export var SPEED = 100.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var dir = Input.get_axis("move left", "move right")
	
	transform.origin += Vector2(dir, 0) * SPEED * delta
	
