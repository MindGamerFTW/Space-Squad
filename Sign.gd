extends StaticBody2D

var stuff 

onready var screen_size = OS.window_size
onready var original_position = $Sprite.position
onready var event1 = InputEventKey.new()

func _ready():
	stuff = Label.new()
	add_child(stuff)

func zoom_in():
	$Sprite.scale = Vector2(7,7)
	$Sprite.position = Vector2(-50,50)
	
func zoom_out(event):
	if event is InputEventKey:
		$Sprite.scale = Vector2(1,1)
		$Sprite.position = original_position
		
func display_sign():
	zoom_in()
	stuff.text = "hello world"

func exit_sign():
	zoom_out(event1)