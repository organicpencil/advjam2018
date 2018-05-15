extends Node

onready var hud = $HUD

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
	hud.message(0, "Here's my generic tavern scene. Exposition and all that. Go ahead and do normal tavern things.")
	yield(hud, "message_finished")
	
	hud.option("Sleep", self, "option_sleep")
	hud.option("Get drunk", self, "option_drunk")
	hud.option("Start a fight", self, "option_fight")
	
func option_sleep():
	hud.message(0, "The party goes to sleep, or something.")
	yield(hud, "message_clicked")
	hud.message(0, "On second thought - let's have a fight anyway.")
	yield(hud, "message_clicked")
	start_combat()
	
func option_drunk():
	hud.message(0, "The rest of the night is a blur. You wake the next morning with a massive headache.")
	yield(hud, "message_clicked")
	hud.message(0, "On second thought - let's have a fight anyway.")
	yield(hud, "message_clicked")
	start_combat()
	
func option_fight():
	hud.message(0, "You attempt to pick fights with random patrons, but they're all too scared to fight back. It's only after smashing a chair over someone's head that the barkeep politely asks you to leave.")
	yield(hud, "message_clicked")
	hud.message(0, "On second thought - let's have a fight anyway.")
	yield(hud, "message_clicked")
	start_combat()