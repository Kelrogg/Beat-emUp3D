extends Spatial

func _process(delta: float) -> void:
	$Camera2D.translation.x = $Character.translation.x
	
