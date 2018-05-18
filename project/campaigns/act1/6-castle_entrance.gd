extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/7-rats.tscn")

var knocked = false

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "You arrive at the dark forboding castle. The door is locked.")
	yield(hud, "message_finished")
	
	hud.option("Break it down", self, "option_break")
	hud.option("Pick the lock", self, "option_pick")
	hud.option("Knock", self, "option_knock")
	
func option_break():
	hud.message(hud.AVATAR_DM, "It takes one good shove to break the door off its hinges. You have gained entrance to the castle!")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)
	
func option_pick():
	hud.message(hud.AVATAR_ROGUE, "I got this.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "You attempt to pick the old rusted lock. Suddenly the handle falls off. The door is still stuck.")
	yield(hud, "message_finished")
	
	hud.option("Break it down", self, "option_break")
	
func option_knock():
	hud.message(hud.AVATAR_DM, "You knock and wait for some time. There is no reply.")
	yield(hud, "message_finished")
	
	hud.option("Break it down", self, "option_break")
	hud.option("Pick the lock", self, "option_pick")