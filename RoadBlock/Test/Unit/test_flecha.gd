extends 'res://addons/gut/test.gd'

# warning-ignore:unused_class_variable
var Flecha = load('res://Script/Flecha/flecha.gd')
# warning-ignore:unused_class_variable
var Pelota = load('res://Script/Ball/ball.gd')

# warning-ignore:unused_class_variable
var fechaobj= load('res://Perphaps/Fecha/flecha.tscn')
var pelotaobj=load('res://Perphaps/Ball/ball.tscn')
var WallObj=load('res://Perphaps/Wall/wall.tscn')	#Creo el objeto Wall


func test_can_flecha_class():				#Esto es para ver si se creo el objeto
	var f= Flecha.new()
	assert_not_null(f)

func test_can_flecha_perphaps():				#Esto es para ver si se creo el objeto
	var fObj= fechaobj.instance()
	assert_not_null(fObj)

func test_get_set_var_direction():			#verifico si la variable Direcction existe
	var f= Flecha.new()
	assert_accessors(f,"directionFlecha",0,100)

func test_set_direction():			#pruebo si realmente la variable direcion funciona
	var f= Flecha.new()
	f.set_directionFlecha(3)
	assert_eq(f.get_directionFlecha(),3)
	
func test_colision_ball_flecha():				#verificar que la pelota colisione
	var fObj= fechaobj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(150,100))
	fObj.set_directionFlecha(2);
	
	
	var bObj=pelotaobj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(fObj.colision,true)
	
	remove_child(fObj)
	remove_child(bObj)

func test_change_ball_direction():				#verificar que la pelota cambie de direccion
	var fObj= fechaobj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(150,100))
	fObj.set_directionFlecha(3);
	
	var bObj=pelotaobj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	var direcBall=bObj.get_direction()
	yield(yield_for(5),YIELD)
	
	assert_ne(bObj.get_direction(),direcBall)
	
	remove_child(fObj)
	remove_child(bObj)

func test_restringir_regreso():				#verificar que la pelota no regrese por el mismo camino
	var fObj= fechaobj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(150,100))
	fObj.set_directionFlecha(2);
	
	var bObj=pelotaobj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	
	var pObj=WallObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(400,100))
	
	yield(yield_for(5),YIELD)
	
	assert_eq(bObj.get_speed(),0)
	
	remove_child(fObj)
	remove_child(bObj)
	remove_child(pObj)
	
func test_habilitar_movimientopelota():				#verificar que la pelota tenga habilitado el movimiento
	var fObj= fechaobj.instance()
	add_child(fObj)
	fObj.set_position(Vector2(150,100))
	fObj.set_directionFlecha(2);
	
	var bObj=pelotaobj.instance()
	add_child(bObj)
	bObj.set_position(Vector2(150,300))
	var direcBall=bObj.get_direction()
	
	var pObj=WallObj.instance()
	add_child(pObj)
	pObj.set_position(Vector2(400,100))
	
	yield(yield_for(5),YIELD)
	
	remove_child(pObj)
	remove_child(fObj)
	remove_child(bObj)

