extends 'res://addons/gut/test.gd'

var Anim=load('res://Script/Animacion/anim.gd')	#Referencio a la clase Ball

var AnimObj=load('res://Perphaps/Animaciones/Animaciones.tscn')	#Creo el objeto Ball
var BallObj=load('res://Perphaps/Ball/ball.tscn')	#Creo el objeto Ball
var PortalObj=load('res://Perphaps/Portal/Portal.tscn')	#Creo el objeto Portal
var WallObj=load('res://Perphaps/Wall/wall.tscn')	#Creo el objeto Wall
var FechaObj= load('res://Perphaps/Fecha/flecha.tscn')
var PortalApoyoObj=load('res://Perphaps/Portal/PortalApoyo.tscn')	#Creo el objeto Portal

func test_can_anim_class():				#Esto es para ver si se creo el objeto
	var a= Anim.new()
	assert_not_null(a)

func test_can_animacion_perphaps():				#Esto es para ver si se creo el objeto
	var aObj= AnimObj.instance()
	assert_not_null(aObj)

func test_have_anim_objects():			#Aqui pruebo si existe la variable NodePath
	var bObj= BallObj.instance()
	var fObj= FechaObj.instance()
	var wObj= WallObj.instance()
	var pObj= PortalObj.instance()
	var paObj= PortalApoyoObj.instance()
	
	assert_eq(bObj.get_anim(),null)
	assert_eq(fObj.get_anim(),null)
	assert_eq(wObj.get_anim(),null)
	assert_eq(pObj.get_anim(),null)
	assert_eq(paObj.get_anim(),null)
	
func test_is_anim_flecha():				#verificar que la flecha se anime
	var animObj=AnimObj.instance()
	add_child(animObj)
	var fObj= FechaObj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(250,300))
	fObj.set_anim(animObj.get_path())
	
	animObj.is_animate=true
	
	yield(yield_for(3),YIELD)
	
	remove_child(fObj)
	remove_child(animObj)

func test_is_anim_ball():				#verificar que la pelota se anime
	var animObj=AnimObj.instance()
	add_child(animObj)
	var bObj= BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(250,300))
	bObj.set_anim(animObj.get_path())
	
	animObj.is_animate=true
	
	yield(yield_for(3),YIELD)
	
	remove_child(bObj)
	remove_child(animObj)

func test_is_anim_wall():				#verificar que la pared se anime
	var animObj=AnimObj.instance()
	add_child(animObj)
	var wObj= WallObj.instance()
	add_child(wObj)
	wObj.set_position(Vector2(250,300))
	wObj.set_anim(animObj.get_path())
	
	animObj.is_animate=true
	
	yield(yield_for(3),YIELD)
	
	remove_child(wObj)
	remove_child(animObj)

func test_is_anim_portalapoyo():				#verificar que el porta de apoyo se anime
	var animObj=AnimObj.instance()
	add_child(animObj)
	var paObj= PortalApoyoObj.instance()
	add_child(paObj)
	paObj.set_position(Vector2(250,300))
	paObj.set_anim(animObj.get_path())
	
	animObj.is_animate=true
	
	yield(yield_for(3),YIELD)
	
	remove_child(paObj)
	remove_child(animObj)

func test_is_anim_portal():				#verificar que el porta de apoyo se anime
	var animObj=AnimObj.instance()
	add_child(animObj)
	var pObj= PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(250,300))
	pObj.set_anim(animObj.get_path())
	
	animObj.is_animate=true
	
	yield(yield_for(3),YIELD)
	
	remove_child(pObj)
	remove_child(animObj)

func test_is_anim_integrate():				#verificar la animacion en toda una escena
	var animObj=AnimObj.instance()
	add_child(animObj)

	var fObj= FechaObj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(489,308))
	var wObj=WallObj.instance()
	add_child(wObj)
	wObj.set_position(Vector2(759,308))
	var pObj=PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(743,175))
	pObj.rotate(PI/2)
	var paObj=PortalApoyoObj.instance()
	add_child(paObj)
	paObj.set_position(Vector2(858,374))
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(478,369))
	
	animObj.is_animate=true
	
	yield(yield_for(3),YIELD)
	
	remove_child(fObj)
	remove_child(animObj)
	remove_child(bObj)
	remove_child(pObj)
	remove_child(paObj)

func test_is_anim_integrate_portal():				#verificar la animacion en toda una escena
	var animObj=AnimObj.instance()
	add_child(animObj)

	var fObj= FechaObj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(489,308))
	var wObj=WallObj.instance()
	add_child(wObj)
	wObj.set_position(Vector2(759,308))
	var pObj=PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(735,175))
	pObj.rotate(PI/2)
	pObj.set_scale(Vector2(2,2))
	var paObj=PortalApoyoObj.instance()
	add_child(paObj)
	paObj.set_position(Vector2(858,374))
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(478,369))
	bObj.set_anim(animObj.get_path())
	
	yield(yield_for(5),YIELD)
	
	remove_child(fObj)
	remove_child(animObj)
	remove_child(bObj)
	remove_child(pObj)
	remove_child(paObj)

func test_stop_anim_integrate():				#verificar la animacion en toda una escena
	var animObj=AnimObj.instance()
	add_child(animObj)

	var fObj= FechaObj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(489,308))
	var wObj=WallObj.instance()
	add_child(wObj)
	wObj.set_position(Vector2(759,308))
	var pObj=PortalObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(735,175))
	pObj.rotate(PI/2)
	pObj.set_scale(Vector2(2,2))
	var paObj=PortalApoyoObj.instance()
	add_child(paObj)
	paObj.set_position(Vector2(858,374))
	var bObj=BallObj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(478,369))
	bObj.set_anim(animObj.get_path())
	
	yield(yield_for(8),YIELD)
	
	assert_eq(animObj.is_animate,false)
	
	remove_child(fObj)
	remove_child(animObj)
	remove_child(bObj)
	remove_child(pObj)
	remove_child(paObj)