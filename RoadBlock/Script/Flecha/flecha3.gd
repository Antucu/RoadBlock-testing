extends Area2D


func _on_Flecha3_area_entered(area):
	area.set_direction(Vector2(0,-1))
	print ("entró a la flecha")