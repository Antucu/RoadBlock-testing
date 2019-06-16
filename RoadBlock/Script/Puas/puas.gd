extends Area2D



func _on_Puas_area_entered(area):
	area.set_position(area.positionIni)
	area.set_speed(0)
	area.is_move=true
	area.set_vectNormal(null)
