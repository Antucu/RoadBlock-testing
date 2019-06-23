extends 'res://addons/gut/test.gd'

var Puas=load('res://Script/Puas/puas.gd')	#Referencio a la clase Portal

var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Creo el objeto Ball
var PuasObj=load('res://Perphaps/Puas/puas.tscn')	#Creo el objeto Portal

func test_can_puas_class():				#Esto es para ver si se creo el objeto
	var p= Puas.new()
	assert_not_null(p)

func test_can_puas_perphaps():				#Esto es para ver si se creo el objeto
	var pObj= PuasObj.instance()
	assert_not_null(pObj)

func test_colision_puas_ball():		#Verificar la colision y si la pelota se puso en la posicion inicial
	var pObj= PuasObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(bObj.get_position(),bObj.positionIni)
	
	remove_child(pObj)
	remove_child(bObj)

func test_colision_puas_ball_is_move():		#Verifcar que la ball se mueva cuando haya vuelto
	var pObj= PuasObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(bObj.is_move,true)
	assert_eq(bObj.get_vectNormal(),null)
	
	remove_child(pObj)
	remove_child(bObj)