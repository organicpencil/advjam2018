extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/2-town.tscn")

func _ready():
	start_encounter()
	
func start_combat():
	hud.hide_message()
	get_parent().initiate_turn_loop()
	
func combat_finished():
	pass
	
func next_encounter():
	hud.message(hud.AVATAR_DM, "<abrupt scene change>")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)

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
	hud.message(hud.AVATAR_DM, "Barkeep: Down the hall on your left. Just try doors until you find one that isn't locked.")
	yield(hud, "message_finished")
	
	hud.option("First door", self, "option_door")
	hud.option("Second door", self, "option_door")
	hud.option("Third door", self, "option_door")
	#hud.message(hud.AVATAR_DM, "On second thought - let's have a fight anyway.")
	#yield(hud, "message_clicked")
	#start_combat()
	
func option_door():
	hud.message(hud.AVATAR_DM, "The first room you try is unoccupied.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_RANGER, "Best we all cram in the same room. Save some money.")
	yield(hud, "message_finished")
	
	hud.option("Whatever", self, "option_morning")
	hud.option("Absolutely not!", self, "option_morning_nopay")
	hud.option("Honestly I'd rather sleep outside", self, "option_morning_outside")
	
func option_morning():
	hud.message(hud.AVATAR_DM, "The party shares a room, with barely enough money to pay for the night. When you pay the next morning, the barkeep is impressed and suggests speaking to <name here> about a possible employment opportunity.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "Impressed that we all fit in such a small room?")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "No, I mean - impressed that you actually paid. Not many people walk into that place with money.")
	yield(hud, "message_clicked")
	
	next_encounter()
	
func option_morning_nopay():
	hud.message(hud.AVATAR_DM, "The party splits off in two rooms. It's actually quite comfortable, despite the cold and a full night of rats scratching in the walls. However - the next morning, the party comes up short and is unable to pay for both rooms.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_ROGUE, "Do they take credit?")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "The barkeep tells you not to worry about it. The people that stay here can rarely pay. He's happy enough that you managed to afford 1 room, and suggests that you seek out <name here> for possible employment.")
	yield(hud, "message_clicked")
	
	next_encounter()
	
func option_morning_outside():
	hud.message(hud.AVATAR_DM, "It's a long and cold night, but only slightly colder than it was inside. At least you're not kept up by the rats in the wall.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "The others chose to share a room, with barely enough money to pay for the night. You regroup in the tavern the next morning. The barkeep - impressed that you actually paid - suggests speaking to <name here> about a possible employment opportunity.")
	yield(hud, "message_clicked")
	
	next_encounter()
	 
	
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
	
	next_encounter()
	
func option_refuse():
	hud.message(hud.AVATAR_DM, "Barkeep: I don\'t know why I even bother. Nobody ever pays.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_ROGUE, "Well then.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_RANGER, "Can we ask him about local employment opportunities?")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "I don't think the barkeep wants to help you right now. However, you do see a flier posted on the wall. <name here> is looking to hire adventuring-types for a special job.")
	yield(hud, "message_clicked")
	
	next_encounter()
	
func option_run():
	hud.message(hud.AVATAR_DM, 'The barkeep eyes you suspiciously. "Alright. But hurry up."')
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_WIZARD, "Nice.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, 'Ok, so you got out of paying the tab. On the way out - you notice a flier on the door. <name here> is seeking "adventurers" for a special job.')
	yield(hud, "message_clicked")
	
	next_encounter()
	
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
	hud.message(hud.AVATAR_DM, "You have GOT to be kidding.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_WIZARD, "Seems like a good idea to me.")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_RANGER, "No! That's a terrible idea!")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_ROGUE, "Agreed. Although... we could totally get away with it.")
	yield(hud, "message_finished")
	
	hud.option("We could use the XP", self, "option_actual_massacre")
	hud.option("Forget it, let's get a room", self, "option_sleep")
	
func option_actual_massacre():
	hud.message(hud.AVATAR_DM, "...")
	yield(hud, "message_clicked")
	hud.message(hud.AVATAR_DM, "Ok then.")
	yield(hud, "message_clicked")
	start_combat()
