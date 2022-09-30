extends Area2D

var main
var error
func _ready():
	main = get_tree().get_current_scene()
	pass


func _on_mush_body_entered(body):
	if body.name == 'player':
		if main.score == 3:
			$AnimationPlayer.play('hit')
		else:
			$AnimationPlayer.play('red')

func _on_AnimationPlayer_animation_finished(_anim_name):
	if main.score == 3:
		queue_free()
		if main.name == "Fruits":
			error = get_tree().change_scene("res://Scenes/animals.tscn")
		else:
			error = get_tree().change_scene("res://Scenes/world.tscn")
	
