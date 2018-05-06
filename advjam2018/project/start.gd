extends Node

export(PackedScene) var next_scene

func _ready():
	# Just a placeholder. Ideally would show some kind of intro splash or menu before switching.
	get_tree().change_scene_to(next_scene)
