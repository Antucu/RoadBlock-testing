extends KinematicBody2D

var MOTION_SPEED = 10
var motion = Vector2()
var velocidadx = 0
var velocidady = 0
var derecha = true
var izquierda = true
var abajo = true
var arriba = true
var colision = false

var move
var hola

func _ready():
	pass

func get_input():
	if Input.is_action_just_pressed('ui_right') and derecha==true:
		velocidadx = 10
		velocidady = 0
		izquierda = false
		abajo = false
		arriba = false
	elif Input.is_action_just_pressed('ui_left') and izquierda==true:
		velocidadx = -10
		velocidady = 0
		derecha = false
		abajo = false
		arriba = false
	elif Input.is_action_just_pressed('ui_down') and abajo==true:
		velocidady = 10
		velocidadx = 0
		izquierda = false
		derecha = false
		arriba = false
	elif Input.is_action_just_pressed('ui_up') and arriba==true:
		velocidady = -10
		velocidadx = 0
		izquierda = false
		derecha = false
		arriba = false
	motion = motion.normalized() * MOTION_SPEED

func _physics_process(delta):
	get_input()
	move_and_slide(motion*delta,Vector2(0, -1), 5, 4, deg2rad(180))
	position.x=position.x+velocidadx
	position.y=position.y+velocidady
	colision = is_on_floor()
	if colision==true:
		izquierda = true
		derecha = true
		derecha = true
		arriba = true
		
		