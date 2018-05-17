extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/3-rabbits.tscn")

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "Putting the tavern behind you, you follow the tip on <name here>. Arrive at place. Stuff happens. What next?")
	yield(hud, "message_finished")
	
	hud.option("Begin the epic journey", self, "option_leave")
	
func option_leave():
	get_tree().change_scene_to(NEXT_ENCOUNTER)
