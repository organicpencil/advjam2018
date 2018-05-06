extends Node2D

enum CHAR_TRAITS {
	QUICK_THINKING, FAST_AIM, LEADER}

export var maxHP = 0
export var hp = 0

export var atk = 0 # ATTACK 		How hard you hit
export var def = 0 # DEFENSE
export var dex = 0 # DEXTERITY 		Magic and stuff
export var sta = 0 # STAMINA 		Allows you to carry and wield more and heavier equipment
export var wsm = 0 # WISDOM 		Allows you to wield and use higher level equipment

export var traits = []
# Traits are special character conditions, this can be anything
# from more chance to crit to a random chance to move an extra tile
# in any given turn or even give a small boost to surrounding companions,
# these traits are defined by the CHAR_TRAITS enum, their classes and
# properties, any given piece can have as many traits as necessary.

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
