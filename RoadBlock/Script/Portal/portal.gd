extends Area2D

var colision=false

export(PackedScene) var _scena_file=null
export(NodePath) var _anim=null
var vecNormalIn=null
var vecNormalOut=null

func _ready():
	print (_anim)

func get_scena_file():
	return _scena_file
	
func set_scena_file(scena):
	_scena_file=scena
	
func get_anim():
	return _anim

func set_anim(nodeAnim):
	_anim=nodeAnim

func _on_Portal_area_entered(area):
	pass
	#colision=true
	#if (_scena_file!=null):
		#get_tree().change_scene_to(_scena_file)

func _on_AreaCuerpo_area_entered(area):
	colision=true
	if (area.is_in_group ("ball")):
		if (area.get_anim()!=null):
			var nodeAnim=get_node(area.get_anim())
			nodeAnim.is_animate=true
			get_node("AudioStreamPlayer").play()
			area.set_scale(Vector2(1,1))

func _on_Extremo_area_entered(area):
	colision=true
	if (area.is_in_group ("ball") ):
		if (vecNormalIn==null or area.get_vectNormal()==vecNormalIn ):
			area.set_speed(0)
			area.is_move=true
			area.set_scale(Vector2(1,1))
			if (area.get_direction()==Vector2(1,0)):
				area.position.x=position.x-30
			if (area.get_direction()==Vector2(-1,0)):
				area.position.x=position.x+30
			if (area.get_direction()==Vector2(0,1)):
				area.position.y=position.y-30
			if (area.get_direction()==Vector2(0,-1)):
				area.position.y=position.y+30
			
			vecNormalIn=area.get_vectNormal()
			vecNormalOut=area.get_vectNormal()
		else:
			vecNormalIn=null

func _on_Extremo_area_exited(area):
	if (area.is_in_group ("ball") ):
		if (vecNormalOut!=area.get_vectNormal()):
			area.is_move=false
		else:
			if (area.get_direction()==Vector2(1,0)):
				area.position.x=position.x-30
			if (area.get_direction()==Vector2(-1,0)):
				area.position.x=position.x+30
			if (area.get_direction()==Vector2(0,1)):
				area.position.y=position.y-30
			if (area.get_direction()==Vector2(0,-1)):
				area.position.y=position.y+30
