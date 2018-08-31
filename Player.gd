extends KinematicBody2D

var motion = Vector2()
var attack = 1
onready var HP = $Interface.get_node("Top_Left").get_node("HP_bar")

func _process(delta):
	for i in get_tree().get_nodes_in_group("Enemies"):
		attack(i)
	dead()

func _physics_process(delta):
	controls(self)

func attack(body):
	if body.get_node("InProximity").entered:
		body.HP -= attack
	
func dead():
	if HP.value == 0:
		get_tree().change_scene("res://Respawn_Screen.tscn")
	
func controls(body):
	if body.name == "Player":
		if Input.is_action_pressed("ui_right"):
			$Sprite.play("right")
			motion.x = 200
			motion.y = 0
			
		elif Input.is_action_pressed("ui_left"):
			$Sprite.play("left")
			motion.x = -200
			motion.y = 0
			
		elif Input.is_action_pressed("ui_up"):
			$Sprite.play("back")
			motion.y = -200
			motion.x = 0
			
		elif Input.is_action_pressed("ui_down"):
			$Sprite.play("front")
			motion.y = 200
			motion.x = 0	
		else:
			motion.x = 0
			motion.y = 0
			
		move_and_slide(motion)
		