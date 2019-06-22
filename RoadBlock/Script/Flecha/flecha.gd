extends Area2D

var colision=false
export(int, "Arriba", "Abajo", "Derecha","Izquieda") var _directionFlecha
var directionBall=Vector2()

func _ready():
	if (_directionFlecha==0):
		directionBall=Vector2(0,1)
	if (_directionFlecha==1):
		directionBall=Vector2(0,-1)
	if (_directionFlecha==2):
		directionBall=Vector2(1,0)
	if (_directionFlecha==3):
		directionBall=Vector2(-1,0)

func set_directionFlecha(direcion):
	_directionFlecha=direcion
	
func get_directionFlecha():
	return _directionFlecha
func _on_Flecha_area_entered(area):
	var auxNormal=-1*area.get_direction()
	if (colision==false or auxNormal!=directionBall):
		if (_directionFlecha==0):
			directionBall=Vector2(0,1)
		if (_directionFlecha==1):
			directionBall=Vector2(0,-1)
		if (_directionFlecha==2):
			directionBall=Vector2(1,0)
		if (_directionFlecha==3):
			directionBall=Vector2(-1,0)
		area.set_direction(directionBall)
		area.set_vectNormal(directionBall)
		colision=true
	else:
		area.set_speed(0)
		area.is_move=true
	