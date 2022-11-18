extends KinematicBody2D

var main
var stone
var direction = 0
var velocity = Vector2()
var is_jumping = false
var fall_has_played = false

const SPEED:int = 400
const GRAVITY = 100
const JUMP = 2000

onready var dino = get_node("Sprite")
onready var walk = get_node("walk_sound")
onready var jump = get_node("jump_sound")
onready var fall = get_node("fall_sound")

func _ready():
	main = get_tree().get_current_scene() 

func _process(_delta):
	direction = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	#if Input.is_action_pressed("ui_right"):
		#direction = 1
	#elif Input.is_action_pressed("ui_left"): #sağa basılı değilse sola basılıysa
		#direction = -1
	#else:
		#direction = 0
		
	if Input.is_action_pressed("ui_select"):
		if is_on_floor():
			is_jumping = true
			velocity.y += -JUMP
			
	velocity.x = direction * SPEED
	velocity.y += GRAVITY
	
	if position.y > 3000:
		var _error = get_tree().reload_current_scene()
	
	#move_and_collide(velocity) # duvarların içinden geçemiyoruz artık
	velocity = move_and_slide(velocity, Vector2(0,-1)) #hareket ettir ve kaydır
	update_animation()
func update_animation():
	
	if is_on_floor():
		if main.health == 0:
			dino.play("Dead")
			if dino.frame == 7:
				var _error = get_tree().reload_current_scene()
			else:
				return
				
		is_jumping = false
		fall_has_played = false
		if direction == 1:
			dino.flip_h = false
			if not walk.playing:
				walk.play()
			dino.play("Walk")
		elif direction == -1:
			dino.flip_h = true
			if not walk.playing:
				walk.play()
			dino.play("Walk")
		else:
			dino.play("Idle")
	else:
		if direction == 1:
			dino.flip_h = false
		elif direction == -1:
			dino.flip_h = true
		if Input.is_action_pressed("ui_select"):
			if not jump.playing:
				jump.play()
			dino.play("Jump")
		else:
			if not is_jumping:
				if not fall.playing:
					if not fall_has_played:
						fall.play()
						fall_has_played=true
			dino.play("Fall")
	if dino.flip_h == true and dino.offset.x > 0:
		dino.offset *= -1
	
	if dino.flip_h == false and dino.offset.x < 0:
		dino.offset *= -1


func _on_Area2D_body_entered(body):
	if body.name.find("stone",0) != -1:
		self.stone = body
		$explosion.emitting = true
		if not $explosion/explosion_sound.playing:
			$explosion/explosion_sound.play()
		$AnimationPlayer.play("hit")
		if main.health > 0:
			main.health -= 20
		main.get_node("HUD").update_health(main.health)
		$stoneTimer.start()
		
func _on_stoneTimer_timeout():
	if self.stone != null:
		self.stone.queue_free()
