extends Label

var temp = 11
# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = "Time Remaining:" + str(int(temp))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	temp-=0.013
	self.text = "Time Remaining:" + str(int(temp))
