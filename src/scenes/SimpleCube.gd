extends StaticBody

func _ready() -> void:
	$Sprite3D.translation.y = -translation.z
