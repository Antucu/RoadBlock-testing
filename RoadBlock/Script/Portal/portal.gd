extends Area2D

var colision=false

export(PackedScene) var _scena_file=null
export(NodePath) var _anim=null

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

func _on_Extremo_area_entered(area):
	colision=true
	if (area.is_in_group ("ball")):
		area.set_speed(0)
		area.is_move=true

func _on_Extremo_area_exited(area):
	if (area.is_in_group ("ball") ):
		area.is_move=false
