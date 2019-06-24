extends Sprite

func _ready():
	pass 
	
func _physics_process(delta):
	if(position.x < 100):
		position.x = position.x+5