class_name Character
extends AnimKinematicBody

onready var states = $MovementStateManager as BaseStateManager

func _ready() -> void:
	states.init(self)
	$AnimatedSprite.translation.y = -translation.z + $AnimatedSprite.get_aabb().size.y * $AnimatedSprite.scale.y / 2

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)

#	print('z - %d' % z_index)	# оставь строчку - мне понравилась
