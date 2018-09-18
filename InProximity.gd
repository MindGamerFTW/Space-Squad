extends Area2D

onready var inside = false
onready var entered = false
var label

signal activate_door()
signal display_sign()
signal exit_sign()
signal aggro()
signal open_lab_menu()

func _ready():
	label = Label.new()
	add_child(label)
	
func entered(body):
	if !get_parent().is_in_group("Enemies") and body.is_in_group("Players"):
		inside = true
		entered = true
		label.text = "Press E to Interact"
		label.rect_position = Vector2(-48,-32)
	elif get_parent().is_in_group("Enemies") and body.is_in_group("Players"):
		inside = true
		entered = true
		emit_signal("aggro", body)

func exited(body):
	inside = false
	label.text = ""
			
func _input(event):
	if inside:
		if event is InputEventKey and event.is_pressed():
			if event.scancode == KEY_E:
				if get_parent().name == "Door":
					emit_signal("activate_door")
				elif get_parent().name == "Sign":
					emit_signal("display_sign")
				elif get_parent().name == "Laboratory":
					emit_signal("open_lab_menu")
			if event.scancode == KEY_ESCAPE:
				emit_signal("exit_sign")