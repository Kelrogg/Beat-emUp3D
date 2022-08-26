extends Spatial

func _process(delta: float) -> void:
	$Camera.translation.x = $Character.translation.x
	
