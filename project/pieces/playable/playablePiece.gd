extends "res://pieces/basePiece.gd"

func _turn():
	if Input.is_action_just_pressed("ui_up"):
		_change_pos(Vector2(0, 1))
		_finish_turn()
	pass
