extends RigidBody2D

var screen_size
const SPEED = 400

func _ready():
	screen_size = get_viewport().size
	pass

func _process(delta):
	position.y += SPEED * delta
	if position.y > screen_size.y:
		queue_free()


func _on_VisibilityNotifier2D_screen_entered():
	pass # Replace with function body.


func _on_VisibilityNotifier2D_screen_exited():
	pass # Replace with function body.
