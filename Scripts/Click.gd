extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Score: %s" % Global.clicks
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "Score: %s" % Global.clicks
	
	if Global.clicks == 0:
		Global.lastClicks *= 2
		Global.clicks = Global.lastClicks
		get_tree().change_scene_to_file("res://Scenes/main.tscn") 

