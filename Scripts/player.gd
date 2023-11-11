extends Node2D


@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Default speed for Character
var speed = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var velocity = Vector2.ZERO
	

	if Input.is_action_pressed("RightMovement"):
		velocity.x += 1
	if Input.is_action_pressed("LeftMovement"):
		velocity.x -= 1
	if Input.is_action_pressed("DownMovement"):
		velocity.y += 1
	if Input.is_action_pressed("UpMovement"):
		velocity.y -= 1
		
	if velocity.x > 0:
		sprite.flip_h = true
	elif velocity.x < 0:
		sprite.flip_h = false
	# Normalize the input vector to ensure consistent movement speed in all directions
	velocity = velocity.normalized()

	# Move the Node2D based on input and speed
	# verify why it breaks when not multiplying by delta
	position += velocity * speed * delta
	
	
	




# Some stuff i read from their documentation
#@export var speed = 400

#func get_input():
#	var input_direction = Input.get_vector("left", "right", "up", "down")
#	velocity = input_direction * speed

#func _physics_process(delta):
#	get_input()
#	move_and_slide()
