extends Control


func _ready():
	pass

func _on_Jugar_pressed():
	get_tree().change_scene("res://Scenas/MainTest/MainTest.tscn")


func _on_Salir_pressed():
	get_tree().quit()