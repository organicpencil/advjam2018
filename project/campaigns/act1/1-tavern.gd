extends Node

onready var hud = get_node("../HUD")

func _ready():
	start_encounter()

func start_encounter():
	# Wait for message_clicked when more dialogue is queued
	hud.message(0, "Here's my generic tavern scene. Exposition and all that. Go ahead and do normal tavern things.")
	yield(hud, "message_finished")
	
	hud.option("Sleep", self, "option_sleep")
	hud.option("Get drunk", self, "option_drunk")
	hud.option("Start a fight", self, "option_fight")
	
func option_sleep():
	hud.message(0, "The party goes to sleep, or something.")
	yield(hud, "message_clicked")
	hud.message(0, "The next morning:")
	yield(hud, "message_clicked")
	hud.message(0, "<write more stuff>")
	
func option_drunk():
	hud.message(0, "The rest of the night is a blur. You wake the next morning with a massive headache.")
	yield(hud, "message_clicked")
	hud.message(0, "<write more stuff>")
	
func option_fight():
	hud.message(0, "You attempt to pick fights with random patrons, but they're all too scared to fight back. It's only after smashing a chair over someone's head that the barkeep politely asks you to leave.")
	yield(hud, "message_clicked")
	hud.message(0, "<write more stuff>")