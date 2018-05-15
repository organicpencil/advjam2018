extends CanvasLayer

signal message_clicked
signal message_finished

onready var dialogue = $Top/Panel/Label

var current_message = ""

func _ready():
	pass

func message(avatar_id, text):
	$Top.show()
	clear_options()
	
	dialogue.text = ""
	current_message = text
	
	if text.length() == 0:
		call_deferred("emit_signal", "message_finished")
	
func hide_message():
	$Top.hide()
	
func option(text, target, callback):
	var opt = preload("res://hud/option.tscn").instance()
	$Bottom/Container/Options.add_child(opt)
	opt.text = text
	opt.connect("pressed", target, callback)
	
func clear_options():
	var options = $Bottom/Container/Options.get_children()
	for node in options:
		node.queue_free()
		
func _input(event):
	if event.is_action_pressed("mouse1"):
		var length = dialogue.text.length()
		if length > 0:
			if length < current_message.length():
				# Skip to end
				dialogue.text = current_message
				emit_signal("message_finished")
			else:
				# Onward
				emit_signal("message_clicked")
		
func _process(delta):
	if dialogue.text.length() < current_message.length():
		dialogue.text = current_message.left(dialogue.text.length() + 1)
		if dialogue.text.length() == current_message.length():
			emit_signal("message_finished")