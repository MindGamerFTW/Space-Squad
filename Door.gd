extends StaticBody2D

export(String, FILE, "*.tscn") var choose_scene


func change_scene():
	if choose_scene == null:
		print("ChooseScene = null")
		return
	else:
		get_tree().change_scene(choose_scene)
	

func activated_door():
	change_scene()
