extends Area2D

#var where we store
#var pokeball_scene = load("res://Scenes/Pokeball.tscn")

#var vel: Vector2 = Vector2()
var speed = 100
var direction = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):

	position += direction * speed * delta
	#self.position += Vector2(1,0).rotated(self.rotation)
	
	#var p = pokeball_scene.instantiate()
	#p.position = self.position
	#p.rotation = 0.02
	
	#p.position.x += 100
	#get_parent().add_child(p)
	#self.position.x += 900
func _on_body_entered(body):
	if body.is_in_group("player"):
		body.take_damage(1)
		queue_free()

func _on_screen_exited():
	queue_free()
