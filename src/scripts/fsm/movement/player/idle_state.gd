extends AnimKinemBodyState

export var move_node: NodePath
export var fall_node: NodePath

onready var move_state: BaseState = get_node(move_node)
onready var fall_state: BaseState = get_node(fall_node)

func enter() -> void:
	.enter()
	managed.velocity.x = 0

func input(_event: InputEvent) -> BaseState:
	if Input.is_action_just_pressed("player_move_left") or Input.is_action_just_pressed("player_move_right"):
		return move_state
	return null
	

func physics_process(_delta: float) -> BaseState:
	managed.velocity.y += managed.gravity
	managed.velocity = managed.move_and_slide(managed.velocity, Vector3.UP)
	
	if !managed.is_on_floor():
		return fall_state
	return null
	
