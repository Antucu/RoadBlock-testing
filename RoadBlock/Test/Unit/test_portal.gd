extends 'res://addons/gut/test.gd'

var Portal=load('res://Script/Portal/portal.gd')	#Referencio a la clase Portal

var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Creo el objeto Ball
var PortalObj=load('res://Perphaps/Portal/Portal.tscn')	#Creo el objeto Portal

var nivel5Escena=load('res://Scenas/Levels/Nivel5.tscn')	#Creo la escenas de niveles

func test_can_portal_class():				#Esto es para ver si se creo el objeto
	var p= Portal.new()
	assert_not_null(p)

func test_can_portal_perphaps():				#Esto es para ver si se creo el objeto
	var pObj= PortalObj.instance()
	assert_not_null(pObj)
	
func test_get_set_var_scena_file():
	var p= Portal.new()
	var n5Sc= nivel5Escena.instance()
	assert_accessors(p,"scena_file",null,n5Sc)

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

func test_set_speed_ball():				#verificar que la pelota colisione
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	pObj.set_scale(Vector2(2,2))
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(bObj.get_speed(),0)
	
	remove_child(pObj)
	remove_child(bObj)

func test_permit_move_ball():				#verificar que la pelota colisione
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(150,100))
	pObj.set_scale(Vector2(2,2))
	
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(bObj.is_move,true)
	
	remove_child(pObj)
	remove_child(bObj)