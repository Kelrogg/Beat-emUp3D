class_name MoveState
extends AnimKinemBodyState

export (NodePath) var jump_node
export (NodePath) var fall_node
export (NodePath) var idle_node

onready var jump_state: BaseState = get_node(jump_node)
onready var fall_state: BaseState = get_node(fall_node)
onready var idle_state: BaseState = get_node(idle_node)

func input(_event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("player_jump"):
		return jump_state
	return null

func physics_process(_delta: float) -> BaseState:
	var move: Vector2 = ._get_movement_input()

	if move.x < 0:
		managed.animations.flip_h = true
	elif move.x > 0:
		managed.animations.flip_h = false
	
	move *= managed.move_speed
	managed.velocity = Vector3(move.x, managed.velocity.y, move.y) 
	managed.velocity.y -= managed.gravity
	managed.velocity = managed.move_and_slide(managed.velocity, Vector3.UP)
	
	managed.animations.translation.y = -managed.translation.z + managed.animations.get_aabb().size.y / 2
	
	if !managed.is_on_floor():
		return fall_state
	
	if managed.velocity == Vector3.ZERO:
		return idle_state

	return null

