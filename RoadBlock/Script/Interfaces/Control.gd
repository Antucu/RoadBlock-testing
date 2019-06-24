extends Control


func _ready():
	pass

func _on_Jugar_pressed():
	get_tree().change_scene("res://Scenas/Levels/lvl1.tscn")


func _on_Salir_pressed():
	get_tree().quit()

func _on_TextureButton_pressed():
	get_tree().change_scene("res://Scenas/Interfaz/Interfaz.tscn")


func _on_Creditos_pressed():
	get_tree().change_scene("res://Scenas/Interfaz/Creditos.tscn")
