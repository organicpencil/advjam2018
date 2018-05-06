extends "res://pieces/basePiece.gd"

func _process(delta):
	#tilemapPosition.x += delta
	tilemapPosition.y += delta
	_change_pos(tilemapPosition)
	pass
