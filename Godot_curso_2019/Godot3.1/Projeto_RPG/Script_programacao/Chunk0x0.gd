extends YSort

export(Vector2) var index

func _ready():
	position  = index*512

func exit_chunk(delta):
	
	#print(delta)
	get_parent().switch_chunk(self,delta)
	
func enter_chunk():
	get_parent().finish_switch()