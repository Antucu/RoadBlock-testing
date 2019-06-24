extends Area2D

export(PackedScene) var _scene_file=null
export(NodePath) var _anim=null
export var velocidad=600

var scena_file_main_test=null

var _speed=0
var sp_scale=1
var _direction=Vector2(0,0)
var is_move=true
var _vectNormal=Vector2(0,0)

var positionIni
	
func _ready():
	positionIni=global_position
	if (scena_file_main_test!=null):			#esto es para hacer la prueba de cambio de escena no la borres
		get_tree().change_scene_to(scena_file_main_test)

func _physics_process(delta):
	var new_pos=_speed*_direction*delta
	set_position(get_position()+new_pos)
	
	if (Input.is_action_just_pressed("ui_right") && is_move):
		_direction=Vector2(1,0)
		_speed=velocidad
		is_move=false
		set_scale(Vector2(1,0.6))
		get_node("AudioStreamPlayer").play()
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(1,0)
		else:
			is_move=true
			set_scale(Vector2(1,1))
			_speed=0
	if (Input.is_action_just_pressed("ui_left") && is_move):
		_direction=Vector2(-1,0)
		_speed=velocidad
		is_move=false
		set_scale(Vector2(1,0.6))
		get_node("AudioStreamPlayer").play()
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(-1,0)
		else:
			is_move=true
			_speed=0
			set_scale(Vector2(1,1))
	if (Input.is_action_just_pressed("ui_up") && is_move):
		_direction=Vector2(0,-1)
		_speed=velocidad
		is_move=false
		set_scale(Vector2(0.6,1))
		get_node("AudioStreamPlayer").play()
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(0,-1)
		else:
			is_move=true
			_speed=0
			set_scale(Vector2(1,1))
	if (Input.is_action_just_pressed("ui_down") && is_move):
		_direction=Vector2(0,1)
		_speed=velocidad
		is_move=false
		set_scale(Vector2(0.6,1))
		get_node("AudioStreamPlayer").play()
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(0,1)
		else:
			is_move=true
			_speed=0
			set_scale(Vector2(1,1))
	
func _on_Area2D_area_entered(area):
	area.set_speed(100)
	area.is_move=true

func _on_Area2D_area_exited(area):
	area.is_move=false

func _on_VisibleCamera_screen_exited():
	if(_anim!=null or _scene_file!=null):
		if (get_node(_anim).is_animate==false):
			set_position(positionIni)
			_speed=0
			is_move=true
			_vectNormal=null
			set_scale(Vector2(1,1))


func get_vectNormal():
	return _vectNormal
	
func set_vectNormal(normal):
	_vectNormal=normal
	
func get_speed():
	return _speed
	
func set_speed(speed):
	_speed=speed

func get_direction():
	return _direction
	
func set_direction(direction):
	_direction=direction
	
func get_scene_file():
	return _scene_file
	
func set_scene_file(scena):
	_scene_file=scena

func get_anim():
	return _anim

func set_anim(nodeAnim):
	_anim=nodeAnim
