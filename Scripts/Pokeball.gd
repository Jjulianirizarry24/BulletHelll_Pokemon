extends Node2D
const speed = 150
#var where we store
#var pokeball_scene = load("res://Scenes/Pokeball.tscn")

#var vel: Vector
#var direction = Vector2.RIGHT
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	
	
	if Global.isHit == true:
		print("IM HIT!")
		Global.isHit = false
		
		
		get_tree().change_scene_to_file("res://Scenes/Caught.tscn")
		#swapState()
		
		
	
	else:
		position += transform.x * speed * delta
	
	
#func swapState():
	# Load the scene
	#var scene_b = load("res://Scenes/Caught.tscn")
	#get_tree().change_scene("res://Scenes/Caught.tscn")
	#Global.goto_scene("res://Scenes/Caught.tscn")


	#position += direction * speed * delta
	#self.position += Vector2(1,0).rotated(self.rotation)
	
	#var p = pokeball_scene.instantiate()
	#p.position = self.position
	#p.rotation = 0.02
	
	#p.position.x += 100
	#get_parent().add_child(p)
	#self.position.x += 900
#func _on_body_entered(body):
	#if body.is_in_group("player"):
		#body.take_damage(1)
		#queue_free()

		
func _on_screen_exited():
	Global.currScore += 1
	print("HEY I WORK")
	queue_free()

#Unsure if i wanna use this yet
func _on_hbox_body_entered(body):
	if body.is_in_group("player"):
		Global.isHit = true
	#body.game_over()


	


func _on_visible_on_screen_notifier_2d_screen_exited():
	Global.currScore += 1
	print("HEY I WORK")
	queue_free()
