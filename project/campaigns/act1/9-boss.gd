extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/test.tscn")

var knocked = false

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "<boss fight>")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Congrats! You beat the boss. More was planned, but we're running short on time. You go back to town and collect your reward etc. Bed time.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_RANGER, "Wait, that's it?")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Yep. Thanks for playing!")
	yield(hud, "message_clicked")

	hud.message(hud.AVATAR_ROGUE, "It really feels like there should be more.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Well, you know. There was a lot of prepwork involved. It was difficult to stay motivated. And I made the mistake of buying Stardew Valley last week.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "That explains it.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "So what's everyone's schedule look like? It might be a few months before we can do this again...")
	yield(hud, "message_finished")
	
	hud.option("Time to pack up and leave.", self, "option_finish")
	
func option_finish():
	hud.message(hud.AVATAR_DM, "PLACEHOLDER: Switch back to the menu or something.")