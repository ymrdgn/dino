extends Area2D

onready var main = get_tree().get_current_scene()
func _ready():
	pass


func _on_mush_body_entered(_body):
	main.score += 1
	main.get_node("HUD").update_score(main.score)
	$AnimationPlayer.play('hit')

func _on_AnimationPlayer_animation_finished(_anim_name):
	queue_free()
