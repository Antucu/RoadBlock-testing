extends Area2D

var colision=false
export(NodePath) var _portalPuente=null

func get_portalPuente():
	return _portalPuente

func set_portalPuente(portal):
	_portalPuente=portal
	
func _on_PortalApoyo_area_entered(area):
	colision=true
	print ("Esto es del portal",_portalPuente)
	if (_portalPuente!=null):
		area.set_position(_portalPuente.get_node("PortalApoyo").get_position())
