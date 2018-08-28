extends Area2D

var entered = false
var label

signal activate_door()

func _ready():
	label = Label.new()
	add_child(label)
	
func entered(body):
	if body.name == "Player":
		entered = true
		label.text = "Press E to Interact"

func exited(body):
	if body.name == "Player":
		entered = false
		label.text = ""
			
func _input(event):
	if entered:
		if event is InputEventKey and event.scancode == KEY_E:
				if get_parent().name == "Door":
					emit_signal("activate_door")