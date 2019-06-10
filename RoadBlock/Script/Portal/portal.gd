extends Area2D

var colision=false
var change=1


func _on_Portal_area_entered(area):
	colision=true
	change=get_tree().change_scene('res://Scenas/Levels/Nivel2.tscn')
	

