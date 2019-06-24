extends 'res://addons/gut/test.gd'

var Nivel1 = load('res://Scenas/Levels/Nivel1.tscn')
var Nivel2 = load('res://Scenas/Levels/Nivel2.tscn')
var Nivel3 = load('res://Scenas/Levels/Nivel3.tscn')
var Nivel4 = load('res://Scenas/Levels/Nivel4.tscn')
var Nivel5 = load('res://Scenas/Levels/Nivel5.tscn')

var WallObj=load('res://Perphaps/Wall/wall.tscn')
var PortalObj=load('res://Perphaps/Portal/Portal.tscn')
var PortalApoyoObj=load('res://Perphaps/Portal/PortalApoyo.tscn')
var BallObj=load('res://Perphaps/Ball/ball.tscn')

func test_have_node_stream_music():
	var n1Obj=Nivel1.instance()
	var n2Obj=Nivel2.instance()
	var n3Obj=Nivel3.instance()
	var n4Obj=Nivel4.instance()
	var n5Obj=Nivel5.instance()
	
	assert_not_null(n1Obj.get_node("AudioStreamPlayer"))
	assert_not_null(n2Obj.get_node("AudioStreamPlayer"))
	assert_not_null(n3Obj.get_node("AudioStreamPlayer"))
	assert_not_null(n4Obj.get_node("AudioStreamPlayer"))
	assert_not_null(n5Obj.get_node("AudioStreamPlayer"))

func test_have_object_music_perphapbs():
	var bObj=BallObj.instance()
	var wObj=WallObj.instance()
	var pObj=PortalObj.instance()
	var paObj=PortalApoyoObj.instance()
	
	assert_not_null(bObj.get_node("AudioStreamPlayer"))
	assert_not_null(wObj.get_node("AudioStreamPlayer"))
	assert_not_null(pObj.get_node("AudioStreamPlayer"))
	assert_not_null(paObj.get_node("AudioStreamPlayer"))
	