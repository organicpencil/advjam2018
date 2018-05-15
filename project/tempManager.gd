extends Node2D

func _flush_temporary_nodes():
	for i in get_children():
		i.queue_free()
	pass
