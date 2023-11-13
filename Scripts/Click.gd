extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Click to Escape: %s" % Global.clicks
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Click to Escape: %s" % Global.clicks
	
	if Global.clicks == 0:
		Global.lastClicks += 10
		Global.clicks = Global.lastClicks
		Global.curTime = 10
		get_tree().change_scene_to_file("res://Scenes/main.tscn") 



func _on_curr_timer_timeout():
	pass # Replace with function body.
