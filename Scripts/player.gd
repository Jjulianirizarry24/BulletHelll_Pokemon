extends CharacterBody2D


#@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Default speed for Character
var speed = 400


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	

	var direction = Input.get_vector("LeftMovement", "RightMovement", "UpMovement", "DownMovement")
	
	velocity.x = speed * direction.x
	velocity.y = speed * direction.y
		
		
	if velocity.x != 0:
		$AnimatedSprite2D.animation = "right"
		$AnimatedSprite2D.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite2D.flip_h = velocity.x < 0
	elif velocity.y < 0:
		$AnimatedSprite2D.animation = "up"
	elif velocity.y > 0:
		$AnimatedSprite2D.animation = "down"
		
	
	move_and_slide()
	
	
	




# Some stuff i read from their documentation
#@export var speed = 400

#func get_input():
#	var input_direction = Input.get_vector("left", "right", "up", "down")
#	velocity = input_direction * speed

#func _physics_process(delta):
#	get_input()
#	move_and_slide()
