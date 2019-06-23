extends 'res://addons/gut/test.gd'

var InterfaceClass=load('res://Script/Interfaces/Control.gd')
var BtnsControlClass=load('res://Script/Pausa/Control.gd')
var BtnsPauseClass=load('res://Script/Pausa/Boton_pausa.gd')

var InterfaceScn=load('res://Scenas/Interfaz/Interfaz.tscn')
var BtnPauseObj=load('res://Perphaps/Menu_Pausa/Boton_pausa.tscn')

func test_can_interfae_control():
	var iClass=InterfaceClass.new()
	
	assert_not_null(iClass)

func test_can_control_buttons():
	var btnControllClass=BtnsControlClass.new()
	var btnPauseClass=BtnsPauseClass.new()
	
	assert_not_null(btnControllClass)
	assert_not_null(btnPauseClass)
	
func test_exists_escena_interfz():
	var intObj=InterfaceScn.instance()
	
	assert_not_null(intObj)

func test_exists_buttons():
	var btnPaObj=BtnPauseObj.intance()
	assert_not_null(btnPaObj)
