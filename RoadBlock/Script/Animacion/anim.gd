extends Node

var is_animate=false
var is_timre=false
var t=0

export(PackedScene) var scene_file=null
export(NodePath) var sp_game_over=null

func _physics_process(delta):
	if (is_animate==true):
		var object=get_tree().get_nodes_in_group("animated")
		for i in object:
			i.position.x=i.position.x+300*delta
			i.position.y=i.position.y+2*t*t*delta
			i.rotate(4*delta)
		t=t+0.3
		if (is_timre==false):
			get_node("Timer").start()
			is_timre=true
		if (sp_game_over!=null):
			get_node(sp_game_over).position.y=get_node(sp_game_over).position.y+2.3

func _on_Timer_timeout():
	is_timre=false
	is_animate=false
	var objectElim=get_tree().get_nodes_in_group("animated")
	#get_tree().change_scene_to(scene_file)
	if (sp_game_over==null):
		get_tree().change_scene_to(scene_file)
		for i in objectElim:
			i.queue_free()
	else:
		get_tree().change_scene("res://Scenas/Interfaz/Creditos.tscn")
