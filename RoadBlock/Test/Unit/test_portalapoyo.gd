extends 'res://addons/gut/test.gd'

var Portal=load('res://Script/Portal/portalapoyo.gd')	#Referencio a la clase Portal

var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Creo el objeto Ball
var PortalObj=load('res://Perphaps/Portal/PortalApoyo.tscn')	#Creo el objeto Portal

func test_can_portal_class():				#Esto es para ver si se creo el objeto
	var p= Portal.new()
	assert_not_null(p)

func test_can_portal_perphaps():				#Esto es para ver si se creo el objeto
	var pObj= PortalObj.instance()
	assert_not_null(pObj)

func test_colision_ball():				#verificar que la pelota colisione
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	pObj.set_scale(Vector2(2,2))
	pObj.rotate(PI/2)
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(pObj.colision,true)
	
	remove_child(pObj)
	remove_child(bObj)

func test_traslate_position_ball():				#verificar que la pelota colisione
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	pObj.set_scale(Vector2(2,2))
	print(pObj.get_path(),"sadasdasdasdasasdsa")
	
	var pObj2= PortalObj.instance()
	add_child(pObj2)
	pObj2.set_position(Vector2(400,350))
	pObj2.set_scale(Vector2(2,2))
	
	pObj.set_portalPuente(pObj2.get_path())
	pObj2.set_portalPuente(pObj.get_path())
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(pObj.colision,true)
	
	remove_child(pObj)
	remove_child(bObj)