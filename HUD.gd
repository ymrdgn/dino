extends CanvasLayer

func show_message(text):
	$Msg.text = text
	$Msg.show()
	$MsgTimer.start()

func update_score(score):
	$ScoreLabel.text = str(score)

func _on_MsgTimer_timeout():
	$Msg.hide()
