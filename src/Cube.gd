extends Area2D


func _ready() -> void:
	set_z_index($Bottom.global_position.y + $Bottom.get_shape().get_extents().y * 2)
