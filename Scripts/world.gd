extends Node2D

#var scene = load("res://Scenes/stone.tscn")
#var stone
var score = 0
#const FRUIT_LENGTH = 4096 #SAHNENİN YATAY BOYU

func _ready():
	$HUD.show_message(get_tree().get_current_scene().get_name())
	#randomize() #her defasında farklı bir rastlansal sayı üretir
	#$stoneTimer.start()
	
#func _on_stoneTimer_timeout():
	#stone = scene.instance()
	#stone.position.y = -1024 #sahnenin 1024px üstünden başlasın demek istiyoruz
	#stone.position.x = randi() % FRUIT_LENGTH
	#add_child(stone)
