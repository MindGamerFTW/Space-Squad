extends Node2D


func _input(event):
	if event is InputEventKey and event.scancode == KEY_E:
		print("works")