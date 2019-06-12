extends 'res://addons/gut/test.gd'

var Wall=load('res://Script/Wall/wall.gd')	#Referencio a la clase Wall
var Ball=load('res://Script/Ball/ball.gd')	#Referencio a la clase Ball

var vida=load('res://Script/Live/live.gd')


func test_live():
	var v = vida.new()
	assert_not_null(v)
	