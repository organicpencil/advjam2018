extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/1-tavern.tscn")

func _ready():
	start_encounter()
	
func start_encounter():
	hud.message(hud.AVATAR_DM, "Your party has traveled to the city of Ylihcester in search of violent work. The sun has fallen and only one inn has available rooms: The Squeaking Freezer, renowned for its rats and poor insulation.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_RANGER, "How do you even spell that?")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Y-L-I-H-C-E-S-T-E-R")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_RANGER, "That doesn't make any sense.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Are you going to let me do this or not? Anyway.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "You enter and approach the bar...")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_ROGUE, "Wait a sec, how did we meet?")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "You met at... er... it's irrelevant.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "Old prison buddies.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_DM, "Yeah, sure. Why not.")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)