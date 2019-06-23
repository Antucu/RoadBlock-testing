extends 'res://addons/gut/test.gd'

var nivel1Escena=load('res://Scenas/Levels/Nivel1.tscn')	#Creo la escenas de niveles
var nivel2Escena=load('res://Scenas/Levels/Nivel2.tscn')	#Creo la escenas de niveles
var nivel3Escena=load('res://Scenas/Levels/Nivel3.tscn')	#Creo la escenas de niveles
var nivel4Escena=load('res://Scenas/Levels/Nivel4.tscn')	#Creo la escenas de niveles
var nivel5Escena=load('res://Scenas/Levels/Nivel5.tscn')	#Creo la escenas de niveles

var Pelota = load('res://Script/Ball/ball.gd')

var Pelotaobj=load('res://Perphaps/Ball/ball.tscn')

func test_existe_escena():			#Compruebo si existen los niveles
	var n1Sc= nivel1Escena.instance()
	assert_not_null(n1Sc)
	var n2Sc= nivel2Escena.instance()
	assert_not_null(n2Sc)
	var n3Sc= nivel3Escena.instance()
	assert_not_null(n3Sc)
	var n4Sc= nivel4Escena.instance()
	assert_not_null(n4Sc)
	var n5Sc= nivel5Escena.instance()
	assert_not_null(n5Sc)

func test_ball_get_set_esenas():
	var b= Pelota.new()
	var n5Sc= nivel5Escena.instance()
	assert_accessors(b,"scene_file",null,n5Sc)
	
func test_set_escena():
	var b= Pelota.new()
	var n5Sc= nivel5Escena.instance()
	b.set_scene_file(n5Sc)
	assert_eq(b.get_scene_file(),n5Sc)
	
func test_cambio_escena():
	var escenaPrueba=load("res://Scenas/MainTest/MainTest.tscn")
	var curretn =get_tree().get_current_scene()
	var instanPrueba=escenaPrueba.instance()
	var bObj= instanPrueba.get_node("Ball")
	bObj.scena_file_main_test=curretn
	#get_tree().change_scene_to(escenaPrueba)
	yield(yield_for(5),YIELD)
	
	assert_eq(get_tree().get_current_scene(),bObj.scena_file_main_test)