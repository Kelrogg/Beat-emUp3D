extends AnimKinemBodyState

export (NodePath) var move_node
export (NodePath) var fall_node
export (NodePath) var jump_node

onready var move_state: BaseState = get_node(move_node)
onready var fall_state: BaseState = get_node(fall_node)
onready var jump_state: BaseState = get_node(jump_node)


func enter() -> void:
	.enter()
	managed.velocity.x = 0
	

func input(_event: InputEvent) -> BaseState:
	if Input.is_action_pressed("player_move_left") or Input.is_action_pressed("player_move_right") or Input.is_action_pressed("player_move_up") or Input.is_action_pressed("player_move_left"):
		return move_state
	if Input.is_action_just_pressed("player_jump"):
		return jump_state
	return null
	

func physics_process(_delta: float) -> BaseState:
	managed.velocity.y -= managed.gravity
	managed.velocity = managed.move_and_slide(managed.velocity, Vector3.UP)

	if !managed.is_on_floor():
		return fall_state
	return null
	
