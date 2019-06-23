extends Area2D

export(NodePath) var _anim=null

var _speed=0
var vecNormalIn=null
var vecNormalOut=null
var is_colission=false

func get_speed():
	return _speed
	
func set_speed(speed):
	_speed=speed
	
func get_anim():
	return _anim

func set_anim(nodeAnim):
	_anim=nodeAnim

func _on_Area2D_area_entered(area):
	if (area.is_in_group ("ball") ):
		if (vecNormalIn==null or area.get_vectNormal()==vecNormalIn):
			area.set_speed(0)
			area.is_move=true
			area.set_scale(Vector2(1,1))
			vecNormalIn=area.get_vectNormal()
			vecNormalOut=area.get_vectNormal()
			if (vecNormalIn==Vector2(1,0)):
				area.position.x=position.x-30
			if (vecNormalIn==Vector2(-1,0)):
				area.position.x=position.x+30
			if (vecNormalIn==Vector2(0,1)):
				area.position.y=position.y-30
			if (vecNormalIn==Vector2(0,-1)):
				area.position.y=position.y+30
			get_node("AudioStreamPlayer").play()
			
			vecNormalIn=area.get_vectNormal()
			vecNormalOut=area.get_vectNormal()
		else:
			vecNormalIn=null
			#is_colission=true

func _on_Area2D_area_exited(area):
	if (area.is_in_group ("ball") ):
		if (vecNormalOut!=area.get_vectNormal()):
			area.is_move=false
			
			if(get_node("Timer").is_stopped()):
				get_node("Timer").start()
		else:
			if (area.get_direction()==Vector2(1,0)):
				area.position.x=position.x-30
			if (area.get_direction()==Vector2(-1,0)):
				area.position.x=position.x+30
			if (area.get_direction()==Vector2(0,1)):
				area.position.y=position.y-30
			if (area.get_direction()==Vector2(0,-1)):
				area.position.y=position.y+30

func _on_Timer_timeout():
	vecNormalIn=null
	pass
	#is_colission=true
	#vecNormalOut=null
	
