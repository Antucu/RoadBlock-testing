extends Area2D

var _speed=0
var _direction=Vector2(0,0)
var is_move=true
var _vectNormal=Vector2(0,0)

func get_vectNormal():
	return _vectNormal
	
func set_vectNormal(normal):
	_vectNormal=normal
	
func get_speed():
	return _speed
	
func set_speed(speed):
	_speed=speed

func get_direction():
	return _speed
	
func set_direction(direction):
	_direction=direction

func _process(delta):
	var new_pos=_speed*_direction*delta
	set_position(get_position()+new_pos)
	if (Input.is_action_just_pressed("ui_right") && is_move):
		_direction=Vector2(1,0)
		_speed=250
		is_move=false
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(1,0)
		else:
			_speed=1
	if (Input.is_action_just_pressed("ui_left") && is_move):
		_direction=Vector2(-1,0)
		_speed=250
		is_move=false
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(-1,0)
		else:
			_speed=1
	if (Input.is_action_just_pressed("ui_up") && is_move):
		_direction=Vector2(0,-1)
		_speed=250
		is_move=false
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(0,-1)
		else:
			_speed=1
	if (Input.is_action_just_pressed("ui_down") && is_move):
		_direction=Vector2(0,1)
		_speed=250
		is_move=false
		if (_vectNormal!=_direction):
			_vectNormal=Vector2(0,1)
		else:
			_speed=1