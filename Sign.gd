extends StaticBody2D

var label
var org_label_pos

onready var screen_size = OS.window_size
onready var org_sprite_pos = $Sprite.position
onready var event1 = InputEventKey.new()

func _ready():
	label = Label.new()
	add_child(label)
	org_label_pos = label.rect_position	

func zoom_in():
	$Sprite.scale = Vector2(7,7)
	$Sprite.position = Vector2(-50,50)
	label.text = "hello world"
	label.rect_scale = Vector2(5,5)
	label.rect_position = Vector2(-200,-100)
	
func zoom_out(event):
	if event is InputEventKey:
		$Sprite.scale = Vector2(1,1)
		$Sprite.position = org_sprite_pos
		label.rect_scale = Vector2(1,1)
		label.rect_position = org_label_pos
		label.text = ""
		
func display_sign():
	zoom_in()

func exit_sign():
	zoom_out(event1)