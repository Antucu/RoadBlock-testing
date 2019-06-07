extends Area2D

var _speed=0
var _direction=Vector2(0,0)
var is_move=false

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
	if (Input.is_action_just_pressed("ui_left") && is_move):
		_direction=Vector2(-1,0)
		_speed=250
	if (Input.is_action_just_pressed("ui_up") && is_move):
		_direction=Vector2(0,-1)
		_speed=250
	if (Input.is_action_just_pressed("ui_down") && is_move):
		_direction=Vector2(0,1)
		_speed=250