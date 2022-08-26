class_name AnimKinemBodyState
extends BaseState

export var animation_name: String

var managed: AnimKinematicBody

func enter() -> void:
	managed.animations.play(animation_name)
	
