class_name AnimKinematicBody
extends KinematicBody

export var animated_sprite_node: NodePath

export var move_speed := 60
export var jump_force := 100
export var gravity := 4
var velocity := Vector3.ZERO

onready var animations := get_node(animated_sprite_node) as AnimatedSprite3D
