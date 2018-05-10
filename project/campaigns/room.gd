extends Node

export(PackedScene) var first_encounter

func _ready():
	assert(first_encounter != null)
	var scene = first_encounter.instance()
	add_child(scene)
