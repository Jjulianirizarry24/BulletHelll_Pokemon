extends Node2D

#var where we store
@export var pokeball_scene = load("res://Scenes/Pokeball.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


"res://Scenes/enemy.tscn"
var i = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#rotate(0.05)
	var pball = pokeball_scene.instantiate()
	
	
	
	pball.position = self.position
	#pball.rotation = self.rotation
	pball.position.x += 10 + i
	i += 1
	get_parent().add_child(pball)
	


func _on_timer_timeout():
	pass # Replace with function body.
