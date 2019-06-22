extends Area2D

var colision=false
export(PackedScene) var _scena_file=null

func get_scena_file():
	return _scena_file
	
func set_scena_file(scena):
	_scena_file=scena

func _on_Portal_area_entered(area):
	colision=true
	if (_scena_file!=null):
		get_tree().change_scene_to(_scena_file)

func _on_AreaCuerpo_area_entered(area):
	colision=true
	if (_scena_file!=null):
		get_tree().change_scene_to(_scena_file)

func _on_Extremo_area_entered(area):
	colision=true
	area.set_speed(0)
	area.is_move=true

func _on_Extremo_area_exited(area):
	area.is_move=false
