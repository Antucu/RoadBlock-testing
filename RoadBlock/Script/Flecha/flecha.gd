extends Area2D


func parar(ball):
	pass
	
func _on_Flecha_area_entered(area):
	area.set_direction(Vector2(1,0))
	print ("entró a la flecha")
	area.set_speed(0)
	area.is_move=true

func _on_Area2D_area_exited(area):
	area.is_move=false