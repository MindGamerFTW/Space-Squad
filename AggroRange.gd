extends Area2D

onready var in_aggro_range = false

func entered(body):
	if body.name == "Player":
		in_aggro_range = true
