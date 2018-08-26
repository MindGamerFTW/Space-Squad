extends Area2D

export(String, FILE, "*.tscn") var ChooseWorld

func _ready():
	connect("body_entered", self, "_on_MoveBetweenRooms_area_entered")

func _on_MoveBetweenRooms_area_entered(body):
	if ChooseWorld == null:
		print("ChooseWorld = null")
		return
	if body.name == "Player":
		get_tree().change_scene(ChooseWorld)
		
	
