extends KinematicBody2D

var motion = Vector2()

func _physics_process(delta):
	
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
	

		
		
	
	

	
	
	
	