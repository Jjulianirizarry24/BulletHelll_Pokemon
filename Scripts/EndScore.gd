extends Label


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "SCORE: " + str(Global.finalScore)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = "SCORE: " + str(Global.finalScore)
