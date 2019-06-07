extends Area2D

var _speed=0
var collider=false

func get_speed():
	return _speed
	
func set_speed(speed):
	_speed=speed
	
func parar(ball):
	pass

func _on_Area2D_area_entered(area):
	area.set_speed(1)
	area.is_move=true


func _on_Area2D_area_exited(area):
	area.is_move=false
