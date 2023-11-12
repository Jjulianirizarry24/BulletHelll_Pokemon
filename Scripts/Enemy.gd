extends CharacterBody2D

#var where we store
@export var pokeball_scene = load("res://Scenes/Pokeball.tscn")

#WHAT THE HELL IS ONREADY VAR
@onready var shoot_timer = $TimeToShoot
@onready var patternTimer = $TimePatternChange
@onready var rotate = $rotator

#@onready var pathfollow = get_parent()
#@export var path : String = "linear"

var speed = 0.5
var vel = Vector2(randf(), randf()).normalized() * speed


#velocity.x = speed * direction.x
#velocity.y = speed * direction.y

var rotate_speed = 100
var shoot_timer_wait = 0.1
var spawnpoint_count = 2
var radius = 30
var step = 0
var spawnPoint = Node2D.new()
var pos = 0
var screen_size = get_viewport_rect().size
# Called when the node enters the scene tree for the first time.
func _ready():
	step = 2 * PI / spawnpoint_count
	
	#self.position.x = screen_size.x / 2
	#self.position.y = screen_size.y / 2
	
	for i in range(spawnpoint_count):
		spawnPoint = Node2D.new()
		pos = Vector2(radius, 0).rotated(step*i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotate.add_child(spawnPoint)
		
	shoot_timer.wait_time = shoot_timer_wait
	
	shoot_timer.start()
	
	# STuff i added but yet not understand
	patternTimer.wait_time = 5
	patternTimer.start()
	
	# Starting pos for enemy
	self.position = Vector2(720,390)



#var upperBound = 100
#var lowerBound = 700
#var leftBound = 200
#var rightBound = 1400
#var updownDir = false
#var leftrightDir = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_rotate = rotate.rotation_degrees + rotate_speed * delta
	rotate.rotation_degrees = fmod(new_rotate, 360)
	
	var random_direction = Vector2(randf_range(0, 360), randf_range(0, 360)).normalized()
	vel = random_direction * speed


	for instance in get_slide_collision_count():
		var c = get_slide_collision(instance)
		if c.get("number") == 0:
			vel.x = -vel.x
		elif c.get("number") == 1:
			vel.y = -vel.y

	move_and_collide(vel)
			
	#Set random path or something
	
	#if self.position.x != 200 and self.position.x  != 1400:
	#	if updownDir:
	#		self.position.x -= 10
	#		updownDir = !updownDir 
	#	else:
	#		self.position.x += 10
	#		updownDir = !updownDir 
		
	#if self.position.y >= 100 and self.position.y  <= 700:
	#	if leftrightDir:
	#		self.position.y -= 10
	#		leftrightDir = !leftrightDir 
	#	else:
	#		self.position.y += 10
	#		leftrightDir = !leftrightDir 
	
	
	#pathfollow.h_offset += 100 * delta
	#rotator.rotate(0.05)
	#rotate(0.05)
	#var pball = pokeball_scene.instantiate()
	
	#get_parent().add_child(pball)
	
	


#func _on_TimeToShoot_timeout() -> void:
#	for s in rotate.get_children():
		
func _on_TimeToShoot_timeout():
	for b in rotate.get_children():
		var pball = pokeball_scene.instantiate()
		get_tree().root.add_child(pball)
		pball.position = b.global_position
		pball.rotation = b.global_rotation
	
	
	
#This function generates dif. patterns
func patternGen(rotate_speed,shoot_timer_wait,spawnpoint_count):
	
	step = 2 * PI / spawnpoint_count
	
	for i in range(spawnpoint_count):
		spawnPoint = Node2D.new()
		pos = Vector2(radius, 0).rotated(step*i)
		spawnPoint.position = pos
		spawnPoint.rotation = pos.angle()
		rotate.add_child(spawnPoint)

func _on_TimePatternChange_timeout():
	#Generate random int from 0 to 3
	#var randomPattern = randi_range(0,3)
	var randomPattern = 0
	
	for b in rotate.get_children():
		b.queue_free()
	
	
	#for b in rotate.get_children():
		#b.queue_free()
	

	if randomPattern == 0:
		
		patternGen(120,0.01,6)
		
			
	elif randomPattern == 1:
		patternGen(130,0.5,3)
		
			
	elif randomPattern == 2:
		patternGen(180,0.20,8)
	elif randomPattern == 3:
		patternGen(300,0,4)
	elif randomPattern == 4:
		patternGen(70,1,10)
	elif randomPattern == 5:
		patternGen(40,1,15)



	
	
		
