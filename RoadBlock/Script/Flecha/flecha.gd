extends Area2D

export(NodePath) var _anim=null
export(int, "Arriba", "Abajo", "Derecha","Izquieda") var _directionFlecha

var directionBall=Vector2()
var colision=false
var t=0

func _ready():
	if (_directionFlecha==0):
		directionBall=Vector2(0,1)
	if (_directionFlecha==1):
		directionBall=Vector2(0,-1)
	if (_directionFlecha==2):
		directionBall=Vector2(1,0)
	if (_directionFlecha==3):
		directionBall=Vector2(-1,0)
		
func _physics_process(delta):
	#print (delta)
	#position.x=position.x+300*delta
	#position.y=position.y+0.5*t*t*delta
	#t=t+0.3
	#rotate(4*delta)
	pass
	

func set_directionFlecha(direcion):
	_directionFlecha=direcion
	
func get_directionFlecha():
	return _directionFlecha

func get_anim():
	return _anim

func set_anim(nodeAnim):
	_anim=nodeAnim
	
func _on_Flecha_area_entered(area):
	if (area.is_in_group ("ball") ):
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

	