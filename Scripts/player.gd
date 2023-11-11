extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Default speed for Character
var speed = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_vector = Vector2.ZERO

	if Input.is_action_pressed("ui_right"):
		input_vector.x += 1
	if Input.is_action_pressed("ui_left"):
		input_vector.x -= 1
	if Input.is_action_pressed("ui_down"):
		input_vector.y += 1
	if Input.is_action_pressed("ui_up"):
		input_vector.y -= 1
	# Normalize the input vector to ensure consistent movement speed in all directions
	input_vector = input_vector.normalized()

	# Move the Node2D based on input and speed
	# verify why it breaks when not multiplying by delta
	position += input_vector * speed * delta
	
	
	




# Some stuff i read from their documentation
#@export var speed = 400

#func get_input():
#	var input_direction = Input.get_vector("left", "right", "up", "down")
#	velocity = input_direction * speed

#func _physics_process(delta):
#	get_input()
#	move_and_slide()
