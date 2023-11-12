extends CharacterBody2D


#@onready var sprite = $Sprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	self.position = Vector2(50,50)
	

# Default speed for Character
var speed = 500

func _process(delta):
	if Global.isHit:
		pass

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
	
#	for instance in get_slide_collision_count():
#		var c = get_slide_collision(instance)
#		c.get("number") == 1
	
	


