extends Area2D


func _on_Flecha1_area_entered(area):
	area.set_direction(Vector2(-1,0))
	print ("entró a la flecha")