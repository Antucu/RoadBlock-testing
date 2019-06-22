extends Area2D

var colision=false
export(NodePath) var _portalPuente=null

func get_portalPuente():
	return _portalPuente

func set_portalPuente(portal):
	_portalPuente=portal
	
func _on_PortalApoyo_area_entered(area):
	if (colision==false):
		if (_portalPuente!=null):
			area.set_position(get_node(_portalPuente).get_position())
			get_node(_portalPuente).colision=true
		colision=true

func _on_PortalApoyo_area_exited(area):
	if (_portalPuente!=null):
		if (get_node(_portalPuente).colision==true):
			colision=false
			get_node(_portalPuente).colision=false
