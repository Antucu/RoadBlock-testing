extends Control

func _on_Boton_pausa_pressed():
	if get_tree().paused == true:
# warning-ignore:standalone_expression
		get_tree().paused == false
		$efecto.interpolate_property($botones,"rect_position",$botones.rect_position,$botones.rect_position-Vector2(700,0),1,Tween.TRANS_BACK,Tween.EASE_IN)
		$efecto.start()
	else:
		get_tree().paused = true
		$efecto.interpolate_property($botones,"rect_position",$botones.rect_position,$botones.rect_position+Vector2(700,0),1,Tween.TRANS_BACK,Tween.EASE_IN)
		$efecto.start()

func _on_Salir_pressed():
	get_tree().quit()


func _on_Continuar_pressed():
	if get_tree().paused == true:
# warning-ignore:standalone_expression
		get_tree().paused == false
		$efecto.interpolate_property($botones,"rect_position",$botones.rect_position,$botones.rect_position-Vector2(700,0),1,Tween.TRANS_BACK,Tween.EASE_IN)
		$efecto.start()