extends AnimKinemBodyState

export (NodePath) var fall_node
export (NodePath) var idle_node
export (NodePath) var move_node

onready var fall_state: BaseState = get_node(fall_node)
onready var idle_state: BaseState = get_node(idle_node)
onready var move_state: BaseState = get_node(move_node)

func enter() -> void:
	.enter()
	managed.velocity.y = -managed.jump_force

func physics_process(_delta: float) -> BaseState:
	var move = 0
	if Input.is_action_pressed("player_move_left"):
		move = -1
		managed.animations.flip_h = true
	elif Input.is_action_pressed("player_move_right"):
		move = 1
		managed.animations.flip_h = false
	
	managed.velocity.x = move * managed.move_speed
	managed.velocity.y += managed.gravity
	managed.velocity = managed.move_and_slide(managed.velocity, Vector3.UP)
	
	if managed.velocity.y > 0:
		return fall_state

	if managed.is_on_floor():
		if move != 0:
			return move_state
		return idle_state
	return null
