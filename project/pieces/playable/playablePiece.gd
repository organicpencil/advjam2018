extends "res://pieces/basePiece.gd"

onready var tileMovementIndicator = load("res://prefabs/TileMovementIndicator.tscn")

func _begin_turn():
	_display_movement_options()
	pass

func _turn():
	if Input.is_action_just_pressed("mouse1"):
		if $".."._get_range(tilemapPosition, movementRange).has($"..".world_to_map(get_global_mouse_position())):
			print("GOTCHEE" + str($"..".world_to_map(get_global_mouse_position())))
		else:
			print("F" + str($"..".world_to_map(get_global_mouse_position())))
		_finish_turn()
	pass

func _end_turn():
	$"../Temp"._flush_temporary_nodes()
	pass

func _display_movement_options():
	for t in $".."._get_range(tilemapPosition, movementRange):
		var i = tileMovementIndicator.instance()
		i.position = $"..".map_to_world(t)
		$"../Temp".add_child(i)
	pass
