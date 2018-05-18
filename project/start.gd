extends Node

export(PackedScene) var credits
export(PackedScene) var next_scene

func _ready():
	pass


func _on_button_start():
	get_tree().change_scene_to(next_scene)
	pass # replace with function body


func _on_button_exit():
	get_tree().quit()
	pass # replace with function body


func _on_button_credits():
	get_tree().change_scene_to(credits)
	pass # replace with function body
