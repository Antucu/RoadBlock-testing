extends Area2D


func parar(ball):
	pass
	
func _on_Flecha_area_entered(area):
	area.set_direction(Vector2(1,0))
	print ("entró a la flecha")