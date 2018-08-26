extends Area2D

var label
		
func _ready():
	label = Label.new()
	add_child(label)
	connect("body_entered", self , "_on_in_proximity_area_entered")
 connect("body_exited", self, "_on_in_proximity_area_exited")

func _on_in_proximity_area_entered(body):
	if body.name == "Player":
		label.text = "press E to interact"

func _on_in_proximity_area_exited(body):
	if body.name == "Player":
		label.text = ""
