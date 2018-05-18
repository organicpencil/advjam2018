extends Node

onready var hud = $HUD
var NEXT_ENCOUNTER = preload("res://campaigns/act1/5-woods.tscn")

func _ready():
	start_encounter()

func start_encounter():
	#get_parent().connect("insert_signal_for_combat_finished_here", self, "combat_finished")
	# Wait for message_clicked when more dialogue is queued
	hud.message(hud.AVATAR_DM, "The party travels all afternoon until you stumble upon a secluded area. This looks like a good place to make camp.")
	yield(hud, "message_finished")
	
	hud.option("Continue travelling", self, "option_travel")
	hud.option("Set up camp", self, "option_camp")
	
##########
func option_travel():
	hud.message(hud.AVATAR_DM, "You continue travelling into the night...")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)
	
##########
func option_camp():
	hud.message(hud.AVATAR_DM, "The night is uneventful. You head out the next morning.")
	yield(hud, "message_clicked")
	
	get_tree().change_scene_to(NEXT_ENCOUNTER)