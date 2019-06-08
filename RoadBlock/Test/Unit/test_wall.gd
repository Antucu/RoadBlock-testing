extends 'res://addons/gut/test.gd'

var Wall=load('res://Script/Wall/wall.gd')		#Aqui referencio a la clase wall
var Ball=load('res://Script/Ball/ball.gd')		#Aqui referencio a la clase Ball

var WallObj=load('res://Perphaps/Wall/wall.tscn')	#Aqui creo el perprhaps
var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Aqui creo el perprahs Ball

func test_can_wall():				#este test es para ver si tengo una clase Ball
	var p= Wall.new()
	assert_not_null(p)
	
func test_get_set_wall():			#Aqui purebo si el objeto con atributo Speed tiene get y set
	var p= Wall.new()
	assert_accessors(p,"speed",0,100)
	
func test_moves_ball():				#Aqui pruebo si la bola se mueve
	var b=Ball.new()
	b.set_speed(10)
	b.set_direction(Vector2(1,0))
	simulate(b,1,1)
	assert_eq(b.get_position(),Vector2(10,0))
	
func test_ball_controlar_teclas():	#Aqui pruebo si la bola no reacciona cunado presiono las teclas
	var ball= BallObj.instance()
	add_child(ball)
	ball.set_position(Vector2(150,300))
	ball.set_speed(150)
	
	yield(yield_for(5),YIELD)
	
	assert_eq(ball.is_move,false)
	
	remove_child(ball)

func test_is_colision_ball_wall():	#Aqui pruebo si la bola se detiene cuando colisiona
	var wall=WallObj.instance()
	add_child(wall)
	wall.set_position(Vector2(100,100))
	
	var ball= BallObj.instance()
	add_child(ball)
	ball.is_move=false
	ball.set_position(Vector2(95,300))
	
	ball.set_speed(150)
	ball.set_direction(Vector2(0,-1))

	yield(yield_for(5),YIELD)
	assert_eq(ball.get_speed(),0)
	
	remove_child(ball)
	remove_child(wall)
	
func test_controlar_collider_pared_detener():	#Aqui pruebo si la bola no avanza cuando hay una pared
	var wall=WallObj.instance()
	add_child(wall)
	wall.set_position(Vector2(100,100))
	
	var ball= BallObj.instance()
	add_child(ball)
	ball.set_position(Vector2(95,300))
	ball.set_speed(150)
	
	var wall1=WallObj.instance()
	add_child(wall1)
	wall1.set_position(Vector2(100,500))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(ball.get_speed(),0)


