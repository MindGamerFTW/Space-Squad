extends AnimatedSprite

func change_animation():
	if self.frame == 10:
		self.play(self.animation.turn_around)
		