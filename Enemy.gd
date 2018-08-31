extends KinematicBody2D

var attack = 1
var HP = 50
onready var vel = Vector2()
onready var P = get_parent().get_node("Player")

func _process(delta):
	if $InProximity.inside:
		follow_player(P,delta)
	if in_aggro_range(P) and $InProximity.entered:
		follow_player(P,delta)
	attack()
	died()
		
func follow_player(body,delta):
		vel = (body.position-self.position).normalized()*50*delta
		self.position += vel
	
func in_aggro_range(body):
	if body.position.distance_to(self.position) < 500:
		return true
	if $InProximity.entered and body.position.distance_to(self.position) > 500:
		 $InProximity.entered = false
	
func attack():
	if $InProximity.inside:
		P.HP.value -= attack

	