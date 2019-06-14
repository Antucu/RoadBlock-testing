extends 'res://addons/gut/test.gd'

var Ball=load('res://Script/Ball/ball.gd')	#Referencio a la clase Ball

var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Creo el objeto Ball

func test_can_portal_class():				#Esto es para ver si se creo el objeto
	var b= Ball.new()
	assert_not_null(b)

func test_can_portal_perphaps():				#Esto es para ver si se creo el objeto
	var bObj= BallObj.instance()
	assert_not_null(bObj)
	
func test_moves_ball():				#test para mover a la pelota
	var b=Ball.new()
	b.set_speed(10)
	b.set_direction(Vector2(1,0))
	simulate(b,1,1)
	assert_eq(b.get_position(),Vector2(10,0))

func test_ball_controlar_teclas():	#test para restringir el movimiento
	var ball= BallObj.instance()
	add_child(ball)
	ball.set_position(Vector2(150,300))
	ball.set_speed(150)
	
	yield(yield_for(5),YIELD)
	
	assert_eq(ball.is_move,false)
	
	remove_child(ball)

func test_ball_create_position():
	var ball= BallObj.instance()
	add_child(ball)
	ball.set_position(Vector2(150,300))
	ball.set_speed(150)
	
	yield(yield_for(5),YIELD)
	
	assert_not_null(ball.positionIni)
	
	remove_child(ball)
	
func test_ball_retry_position_xtreme():
	pass