extends Area2D

export(NodePath) var _anim=null

var _speed=0
var vecNormalIn=null
var vecNormalOut=null
var is_colission=false
var objArea=null

func get_speed():
	return _speed
	
func set_speed(speed):
	_speed=speed
	
func get_anim():
	return _anim

func set_anim(nodeAnim):
	_anim=nodeAnim
	
func _physics_process(delta):
	for obj in get_overlapping_areas():
		if (obj.is_in_group("ball") and vecNormalIn==null):
			print ("Entro a la colisoin co vect in null")
			if (vecNormalOut==Vector2(1,0)):
				obj.position.x=position.x-31
			if (vecNormalOut==Vector2(-1,0)):
				obj.position.x=position.x+31
			if (vecNormalOut==Vector2(0,1)):
				obj.position.y=position.y-31
			if (vecNormalOut==Vector2(0,-1)):
				obj.position.y=position.y+31
			obj.set_scale(Vector2(1,1))
			obj.is_move=true
			
		if (obj.is_in_group("ball") and vecNormalIn!=null):
			if (obj.is_move==false):
				obj.is_move=true

func _on_Area2D_area_entered(area):
	if (area.is_in_group ("ball") ):
		if (vecNormalIn==null or area.get_vectNormal()==vecNormalIn):
			objArea=area
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
		else:
			vecNormalIn=null
			area.is_move=true

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
	
	
