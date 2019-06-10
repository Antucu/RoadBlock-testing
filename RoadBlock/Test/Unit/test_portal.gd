extends 'res://addons/gut/test.gd'

var Portal=load('res://Script/Portal/portal.gd')	#Referencio a la clase Portal

var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Creo el objeto Ball
var PortalObj=load('res://Perphaps/Portal/Portal.tscn')	#Creo el objeto Portal

func test_can_portal_class():				#Esto es para ver si se creo el objeto
	var p= Portal.new()
	assert_not_null(p)

func test_can_portal_perphaps():				#Esto es para ver si se creo el objeto
	var pObj= PortalObj.instance()
	assert_not_null(pObj)

func test_colision_ball():
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(pObj.colision,true)

func test_cambio_escena():
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(pObj.change,0)
