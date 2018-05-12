extends TileMap

const HEX_DIRS_EVEN = [Vector2(1, 0), Vector2(-1, 0), Vector2(0, -1), Vector2(-1, -1), Vector2(0, 1), Vector2(-1, 1)]
const HEX_DIRS_ODD = [Vector2(1, 0), Vector2(-1, 0), Vector2(0, -1), Vector2(1, -1), Vector2(0, 1), Vector2(1, 1)]

func _get_range(origin, tile_range):
	var tiles = [origin]
	var newTiles = tiles.duplicate()
	var dirs = []
	
	for i in range(0, tile_range):
		for t in newTiles:
			if int(t.y) % 2 == 0:
				dirs = HEX_DIRS_EVEN
			else:
				dirs = HEX_DIRS_ODD
			for dir in dirs:
				if !tiles.has(t + dir):
					tiles.append(t + dir)
		newTiles = tiles.duplicate()
	
	return tiles

#Don't even try to understand what's going on here, it's no use
func _pixel_to_hex_tile(globalPos):
	var pos = globalPos / cell_size
	pos += Vector2(0.5, -0.5)
	
	pos.x += (pos.y - floor(pos.y)) * 0.5
	
	var q = floor(pos.x) - 1
	var r = floor(pos.y) + 1
	
	return Vector2(q, r)
