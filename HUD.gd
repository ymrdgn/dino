extends CanvasLayer

func show_message(text):
	$Msg.text = text
	$Msg.show()
	$MsgTimer.start()

func update_score(score):
	$ScoreLabel.text = str(score)
	
func update_health(health):
	$ProgressBar.value = health

func _on_MsgTimer_timeout():
	$Msg.hide()
	
