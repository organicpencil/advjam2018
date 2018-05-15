extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/0-exposition.tscn")

func _ready():
	start_encounter()
	
func start_combat():
	hud.hide_message()
	get_parent().initiate_turn_loop()
	
func combat_finished():
	pass

func start_encounter():
	print("FIXME - Need signal for combat finish")
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "Putting the tavern behind you, the party follows their lead on <name here>. They arrive at the place. Stuff happens. What next?")
	yield(hud, "message_finished")
	
	hud.option("Begin the epic journey", self, "option_leave")
	
func option_leave():
	hud.message(hud.AVATAR_DM, "<write more stuff>")
