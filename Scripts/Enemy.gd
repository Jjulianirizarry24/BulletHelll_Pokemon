extends Node2D

#var where we store
@export var pokeball_scene = load("res://Scenes/Pokeball.tscn")

#WHAT THE HELL IS ONREADY VAR
@onready var shoot_timer = $TimeToShoot
@onready var patternTimer = $TimePatternChange
@onready var rotate = $rotator

var rotate_speed = 100
var shoot_timer_wait = 0.2
var spawnpoint_count = 2
var radius = 30
var step = 0
var spawnPoint = Node2D.new()
var pos = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	step = 2 * PI / spawnpoint_count
	
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






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var new_rotate = rotate.rotation_degrees + rotate_speed * delta
	rotate.rotation_degrees = fmod(new_rotate, 360)
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
	pass

func _on_TimePatternChange_timeout():
	#Generate random int from 0 to 3
	var randomPattern = randi_range(0,3)
	
	
	for b in rotate.get_children():
		b.queue_free()
	
	
	#for b in rotate.get_children():
		#b.queue_free()
	
	if randomPattern == 0:
		rotate_speed = 0.5
		shoot_timer_wait = 0.20
		spawnpoint_count = 1
		radius = 100
	
		step = 2 * PI / spawnpoint_count
	
		for i in range(spawnpoint_count):
			spawnPoint = Node2D.new()
			pos = Vector2(radius, 0).rotated(step*i)
			spawnPoint.position = pos
			spawnPoint.rotation = pos.angle()
			rotate.add_child(spawnPoint)
			
	if randomPattern == 1:
		rotate_speed = 0.5
		shoot_timer_wait = 0.20
		spawnpoint_count = 2
		radius = 100
	
		step = 2 * PI / spawnpoint_count
	
		for i in range(spawnpoint_count):
			spawnPoint = Node2D.new()
			pos = Vector2(radius, 0).rotated(step*i)
			spawnPoint.position = pos
			spawnPoint.rotation = pos.angle()
			rotate.add_child(spawnPoint)
	if randomPattern == 2:
		rotate_speed = 0.5
		shoot_timer_wait = 0.20
		spawnpoint_count = 3
		radius = 100
	
		step = 2 * PI / spawnpoint_count
	
		for i in range(spawnpoint_count):
			spawnPoint = Node2D.new()
			pos = Vector2(radius, 0).rotated(step*i)
			spawnPoint.position = pos
			spawnPoint.rotation = pos.angle()
			rotate.add_child(spawnPoint)
			
	if randomPattern == 3:
		rotate_speed = 0.5
		shoot_timer_wait = 0.20
		spawnpoint_count = 4
		radius = 100
	
		step = 2 * PI / spawnpoint_count
	
		for i in range(spawnpoint_count):
			spawnPoint = Node2D.new()
			pos = Vector2(radius, 0).rotated(step*i)
			spawnPoint.position = pos
			spawnPoint.rotation = pos.angle()
			rotate.add_child(spawnPoint)

	
	
		
