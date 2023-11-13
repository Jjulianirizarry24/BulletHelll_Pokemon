extends Node2D
const speed = 180

func _ready():
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	

	
	if Global.isHit == true:
		Global.isHit = false
		
		
		get_tree().change_scene_to_file("res://Scenes/Caught.tscn")
		#swapState()
		
		
	
	else:
		position += transform.x * speed * delta
	

		
func _on_screen_exited():
	Global.currScore += 1
	queue_free()

#Unsure if i wanna use this yet
func _on_hbox_body_entered(body):
	if body.is_in_group("player"):
		Global.isHit = true
	#body.game_over()


	


func _on_visible_on_screen_notifier_2d_screen_exited():
	Global.currScore += 1
	queue_free()
