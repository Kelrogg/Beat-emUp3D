class_name AnimKinemBodyState
extends BaseState

export var animation_name: String

var managed: AnimKinematicBody


#func ready() -> void:
#	managed.animations.translation.y = managed.translation.z


func enter() -> void:
	managed.animations.play(animation_name)
	

func _get_movement_input() -> Vector2:
	var velocity = Vector2.ZERO
	if Input.is_action_pressed("player_move_right"):
		velocity.x = 1
	if Input.is_action_pressed("player_move_left"):
		velocity.x = -1
	if Input.is_action_pressed("player_move_down"):
		velocity.y = -1
	if Input.is_action_pressed("player_move_up"):
		velocity.y = 1
	return velocity.normalized()
