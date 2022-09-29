extends Node2D

var score = 0

func _ready():
	$HUD.show_message(get_tree().get_current_scene().get_name())
