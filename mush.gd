extends Area2D

func _ready():
	pass


func _on_mush_body_entered(body):
	$AnimationPlayer.play('hit')
	
