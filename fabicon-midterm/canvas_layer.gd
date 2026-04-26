extends CanvasLayer

signal start_game

func show_message(text):
	$message.text=text
	$message.show()
	$messagetimer.start()
	
func show_game_over():
	show_message("gameover")
	await  $messagetimer.timeout
	
	$message.text ="welcome to the game"
	$message.show()
	await  get_tree().create_timer(1.0).timeout
	$startbutton.show()
	
func update_score(score):
	$scorelabel.text=str(score)
	

func _on_startbutton_pressed():
	$startbutton.hide()
	start_game.emit()
	


func _on_messagetimer_timeout():
	$message.hide()
	
	
