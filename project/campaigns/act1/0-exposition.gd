extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/1-tavern.tscn")

func _ready():
	start_encounter()
	
func start_encounter():
	## Character intro
	hud.message(hud.AVATAR_DM, "Hi there! Allow me to introduce everyone...")
	yield(hud, "message_clicked")
	
	var chicken = hud.get_node("Bottom/Container/Chicken")
	var duck = hud.get_node("Bottom/Container/Duck")
	var goose = hud.get_node("Bottom/Container/Goose")
	var offset = Vector2(256, -312)
	var scale = Vector2(0.5, 0.5)
	
	chicken.rect_position += offset
	chicken.rect_scale += scale
	hud.message(hud.AVATAR_DM, "This is the chicken, playing a ranger and survivalist, highly skilled with the bow.")
	yield(hud, "message_clicked")
	chicken.rect_position -= offset
	chicken.rect_scale -= scale
	
	duck.rect_position += offset
	duck.rect_scale += scale
	hud.message(hud.AVATAR_DM, "That’s the other duck, playing a rogue, silent killer and master of stealth.")
	yield(hud, "message_clicked")
	duck.rect_position -= offset
	duck.rect_scale -= scale
	
	goose.rect_position += offset
	goose.rect_scale += scale
	hud.message(hud.AVATAR_DM, "The goose is running a wizard, brilliant scholar and wielder of powerful magic.")
	yield(hud, "message_clicked")
	goose.rect_position -= offset
	goose.rect_scale -= scale
	
	hud.message(hud.AVATAR_DM, "You get to play the generic fighter.")
	yield(hud, "message_finished")
	
	hud.option("I AM READY", self, "begin")
	
func begin():
	hud.message(hud.AVATAR_DM, "Then let us begin...")
	yield(hud, "message_clicked")
	
	get_node("../Panel").queue_free()
	
	hud.message(hud.AVATAR_DM, "Your party has traveled to the city of Ylihcester in search of violent work. The sun has fallen and only one inn has available rooms: The Squeaking Freezer, renowned for its rats and poor insulation.")
	yield(hud, "message_clicked")
	
	hud.message(hud.AVATAR_WIZARD, "Ylihcester? How do you even spell that?")
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