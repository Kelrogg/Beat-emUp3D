class_name MoveState
extends AnimKinemBodyState

export (NodePath) var jump_node
export (NodePath) var fall_node
export (NodePath) var idle_node

onready var jump_state: BaseState = get_node(jump_node)
onready var fall_state: BaseState = get_node(fall_node)
onready var idle_state: BaseState = get_node(idle_node)

func input(_event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("player_move_up"):
		return jump_state
	return null
	
func physics_process(_delta: float) -> BaseState:
	if !managed.is_on_floor():
		return fall_state
	
	var move = _get_movement_input()
	if move < 0:
		managed.animations.flip_h = true
	elif move > 0:
		managed.animations.flip_h = false
	
	managed.velocity.y += managed.gravity
	managed.velocity.x = move * managed.move_speed
	managed.velocity = managed.move_and_slide(managed.velocity, Vector3.UP)
	
	if move == 0:
		return idle_state
	
	return null
	
func _get_movement_input() -> int:
	if Input.is_action_just_pressed("player_move_left"):
		return -1
	elif Input.is_action_just_pressed("player_move_right"):
		return 1
	return 0
