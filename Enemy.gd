extends KinematicBody2D

onready var vel = Vector2()

onready var p = get_parent().get_node("Player")


func _process(delta):
	if $InProximity.inside:
		follow_player(p,delta)
	if in_aggro_range(p) and $InProximity.entered:
		follow_player(p,delta)
		

func follow_player(body,delta):
	
		vel = (body.position-self.position).normalized()*100*delta
		self.position += vel
	
func in_aggro_range(body):
	if body.position.distance_to(self.position) < 500:
		return true
	else:
		return false