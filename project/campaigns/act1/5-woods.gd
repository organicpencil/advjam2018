extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/test.tscn")

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "Well, the module called for another encounter in the woods, but I ran out of time. So we're skipping directly to the wizard's castle.")
	yield(hud, "message_clicked")
	
	change_scene_to(NEXT_ENCOUNTER)