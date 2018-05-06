extends Node2D

signal _finished_turn()

enum CHAR_TRAITS {
	NONE, QUICK_THINKING, FAST_AIM, LEADER}

export var tilemapPosition = Vector2(0, 0) # Grid Position

export var maxHP = 0
export var hp = 0

export var atk = 0 # ATTACK 		How hard you hit
export var def = 0 # DEFENSE
export var dex = 0 # DEXTERITY 		Magic and stuff
export var sta = 0 # STAMINA 		Allows you to carry and wield more and heavier equipment
export var wsm = 0 # WISDOM 		Allows you to wield and use higher level equipment

# Trait Dictionary	TRAIT : INTENSITY
export var traits = {NONE : 0}
# Traits are special character conditions, this can be anything
# from more chance to crit to a random chance to move an extra tile
# in any given turn or even give a small boost to surrounding companions,
# these traits are defined by the CHAR_TRAITS enum, their classes and
# properties, any given piece can have as many traits as necessary, this var
# is a Dictionary, with the first element being the trait itself and the second
# being a multiplier (where applicable).

func _ready():
	position = $"..".map_to_world(tilemapPosition)
	pass

func _change_pos(newPos):
	tilemapPosition += newPos
	position = $"..".map_to_world(tilemapPosition)
	pass

func _process_turn():
	var finishTurn = false
	while !finishTurn:
		finishTurn = _turn()
		yield(get_tree(), "idle_frame")
	emit_signal("_finished_turn")
	return

func _turn():
	if Input.is_action_just_pressed("ui_up"):
		_change_pos(Vector2(0, 1))
		return true
	return false
