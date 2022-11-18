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
	if not $fall_stone.playing:
		$fall_stone.play()

func _on_VisibilityNotifier2D_screen_exited():
	if $fall_stone.playing:
		$fall_stone.stop()
