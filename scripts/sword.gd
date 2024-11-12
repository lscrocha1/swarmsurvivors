extends Area3D

func _process(delta: float) -> void:
	_follow_mouse(delta)
	
func _follow_mouse(delta: float) -> void:
	var mouse_position = get_viewport().get_mouse_position()
	print(mouse_position)
	rotation.y = mouse_position.x * delta
