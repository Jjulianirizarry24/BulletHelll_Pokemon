extends Node2D

@onready var anim = $AnimatedSprite2D
@onready var sprt = $Sprite2D
@onready var txt = $Label
@onready var btn = $Button
# Called when the node enters the scene tree for the first time.
func _ready():
	anim.play("default")
	# Get the size of the screen
	var screen_size = get_viewport_rect().size
	$Timer.start()
	$AudioStreamPlayer.play (0.5)

	# Set the position of the sprite to the center of the screen
	#anim.position.x = screen_size.x/2
	#anim.position.y = screen_size.y/2


	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	anim.play("default")
	pass


func _on_button_pressed():
	
	Global.clicks -= 1


func _on_timer_timeout():
	get_tree().change_scene_to_file("res://Scenes/GameOver.tscn") 
