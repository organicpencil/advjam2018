extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/8-castle2.tscn")

var knocked = false

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "Well, you're immediately greeted by the evil wizard's army of rats. Unfortunately I'm running out of time, so we're just going to skip this encounter.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "What!?")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)