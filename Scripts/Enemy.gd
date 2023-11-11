extends Area2D

#var where we store
@export var pokeball_scene = load("res://Scenes/Pokeball.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.






# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	rotate(0.05)
	#var pball = pokeball_scene.instantiate()
	#pball.scale = Vector2(2.5,2.5)
	
	#pball.position = self.position
	#pball.rotation = self.rotation
	#pball.position.x += 50
	#get_parent().add_child(pball)
	
