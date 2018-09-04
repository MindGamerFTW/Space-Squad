extends KinematicBody2D

var attack = 1
var HP = 100
var mouseInBody = false
onready var vel = Vector2()
onready var Players = get_tree().get_nodes_in_group("Players")
signal targeted()

func _process(delta):
	if $InProximity.inside:
		follow(delta)
	if in_aggro_range() and $InProximity.entered:
		follow(delta)
	attack()
	died()
		
func follow(delta):
	for i in Players:
		vel = (i.position-self.position).normalized()*50*delta
		self.position += vel
	
func in_aggro_range():
	for i in Players:
		if i.position.distance_to(self.position) < 500:
			return true
		if $InProximity.entered and i.position.distance_to(self.position) > 500:
			 $InProximity.entered = false
	
func attack():
	for i in Players:
		if $InProximity.entered:
			i.HP.value -= attack
		
func died():
	for i in Players:
		if HP == 0:
			queue_free()

func _input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed() and mouseInBody:
		if $InProximity.entered:
			emit_signal("targeted", self)
			$Sprite.modulate = Color(255,255,255,255)

func mouse_entered():
	mouseInBody = true

func mouse_exited():
	mouseInBody = false
