extends Node

var activePieces = []
var turnNumber = 0

signal _finished_turn

func _ready():
	var playablePieces = get_tree().get_nodes_in_group("Playable_Piece")
	for i in range(0, playablePieces.size()):
		activePieces.append(playablePieces[i])
		activePieces[i].connect("_finished_turn", self, "_turn_ended")
	
	var npPieces = get_tree().get_nodes_in_group("Non_Playable_Piece")
	for i in range(0, npPieces.size()):
		activePieces.append(npPieces[i])
	
	for i in range(0, activePieces.size()):
		print(activePieces[i].name + " is in the activePieces list.. -DM")
	
	_initiate_turn_loop()
	pass

func _initiate_turn_loop():
	print("SSSSSSSSSSSSS")
	while true:
		turnNumber += 1
		for i in range(0, activePieces.size()):
			activePieces[i]._process_turn()
			yield(activePieces[i], "_finished_turn")
			print("FUCC")
	pass

func _turn_ended():
	pass
