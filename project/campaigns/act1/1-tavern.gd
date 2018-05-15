extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/test.tscn")

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
	hud.message(hud.AVATAR_DM, "Here's the tavern. There's a few patrons, all scraggly and poorly nourished. The kind of people you'd expect to find in a place like this. The barkeep is on the far side. Nobody takes notice of your entrance.")
	yield(hud, "message_finished")
	
	hud.option("Ask for a room", self, "option_sleep")
	hud.option("Get drunk", self, "option_drunk")
	hud.option("Start a fight", self, "option_fight")
	
##########
func option_sleep():
	hud.message(hud.AVATAR_DM, "<write more stuff>")
	yield(hud, "message_clicked")
	#hud.message(hud.AVATAR_DM, "On second thought - let's have a fight anyway.")
	#yield(hud, "message_clicked")
	#start_combat()
	
##########
func option_drunk():
	hud.message(hud.AVATAR_RANGER, "Think I'll stay sober. You guys have fun.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "One drink turns to three, three turns to a dozen. The rest of the night is a blur. The next morning you wake to the harsh prodding of a broom handle. The barkeep is telling you to pay up.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_ROGUE, "How... how much was it?")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "More than you have, which isn't much.")
	yield(hud, "message_finished")
	
	hud.option("Offer to work it off", self, "option_work")
	hud.option("Refuse to pay, it wasn't that good", self, "option_refuse")
	hud.option("I left my wallet in the car", self, "option_run")
	
func option_work():
	hud.message(hud.AVATAR_DM, 'The barkeep issues a disappointed sigh. "Nobody ever has money. Just do me a favor and try to find honest work. We don\'t need any more troublemakers out here."')
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_RANGER, "Troublemakers, you say? That happens to be our field of expertise.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Barkeep: Hmm... in that case, try <name> over at the <place>. There's been talk of a pesky wizard harassing the countryside.")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)
	
func option_refuse():
	hud.message(hud.AVATAR_DM, "Barkeep: I don\'t know why I even bother. Nobody ever pays.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_ROGUE, "Well then. Had I known that...")
	yield(hud, "message_clicked")
	
func option_run():
	hud.message(hud.AVATAR_DM, 'The barkeep eyes you suspiciously. "Alright. But hurry up."')
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_WIZARD, "Nice.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "<write more stuff>")
	yield(hud, "message_clicked")
	
##########
func option_fight():
	hud.message(hud.AVATAR_DM, "You go to each table trying to pick a fight, but they're all too scared. It's only after smashing a chair over someone's head that the barkeep politely asks you to leave.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_RANGER, "Maybe we should leave these people alone.")
	yield(hud, "message_finished")
	
	hud.option("Calm down and ask for a room", self, "option_sleep")
	hud.option("Try extorting the barkeep", self, "option_extort")
	hud.option("Pointless bloodbath", self, "option_massacre")
	
func option_extort():
	hud.message(hud.AVATAR_DM, "Barkeep: Ha! If you're looking for money, you've come to the wrong place. About the only thing of value here is the lumber in the walls.")
	yield(hud, "message_finished")
	
	hud.option("Well, it was worth a shot. Got a room?", self, "option_sleep")
	hud.option("Rip out some wood and take it with you", self, "option_wood")
	
func option_wood():
	hud.message(hud.AVATAR_RANGER, "Of all things to steal...")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_WIZARD, "Hey, gotta take what you can get.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "Barkeep: Please, don't do that! You can stay the night for free.")
	yield(hud, "message_finished")
	
	hud.option("Fine...", self, "option_sleep")
	
func option_massacre():
	hud.message(hud.AVATAR_DM, "You have GOT to be kidding!")
	#yield(hud, "message_clicked")
	#start_combat()
	yield(hud, "message_finished")
	hud.option("<combat skipped for now>", self, "option_sleep")