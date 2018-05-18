extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/4-camp.tscn")

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "You're travelling through the forest. Suddenly, the party is set-upon by a pack of feral rabbits!")
	yield(hud, "message_finished")
	
	hud.option("Fight", self, "option_fight")
	hud.option("Run away", self, "option_run")
	hud.option("Flap your arms and make loud noises", self, "option_flap")
	
##########
func option_fight():
	hud.message(hud.AVATAR_DM, "<combat not implemented> We'll just call this a victory. Those that can't escape are effortlessly slaughtered.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Moving on...")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)
	
##########
func option_run():
	hud.message(hud.AVATAR_WIZARD, "Wait, seriously? They're just bunnies.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_RANGER, "You wouldn't be the first to think that.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "I cast fireball.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Well, you roasted the bunnies. By the way - that was your only spell slot. And I'm shifting your alignment one point towards evil.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "Wait no I didn't do that. I wanted to hit one with my staff.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Too late, you already cast the spell.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_ROGUE, "I guess we loot the bodies.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "What exactly do you hope to find? Disect the bodies looking for gold?")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_ROGUE, "Yes.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Moving on...")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)
	
##########
func option_flap():
	hud.message(hud.AVATAR_DM, "Looks like you spooked em. They move a few meters away. The path is clear.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Moving on...")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)