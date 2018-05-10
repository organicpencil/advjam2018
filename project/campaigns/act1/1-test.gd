extends Node

onready var hud = get_node("../HUD")

func _ready():
	start_encounter()

func start_encounter():
	# Wait for message_clicked when more dialogue is queued
	hud.message(0, "Placeholder message. AAAAAAAAAAAA. Click to continue.")
	yield(hud, "message_clicked")
	
	# Wait for message_finished when presenting options next
	hud.message(0, "Another placeholder message. Options next!")
	yield(hud, "message_finished")
	
	hud.option("Do stuff", self, "option_stuff")
	
func option_stuff():
	hud.message(0, "Stuff performed")
	yield(hud, "message_finished")
	hud.option("Do more stuff", self, "option_stuff")