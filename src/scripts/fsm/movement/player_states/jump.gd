extends MoveState

export (NodePath) var move_node

onready var move_state: BaseState = get_node(move_node)

func enter() -> void:
	.enter()
	managed.velocity.y = managed.jump_speed

func physics_process(delta: float) -> BaseState:
	var new_state = .physics_process(delta)
	if new_state:
		return new_state
	
#	if managed.velocity.y > 0:
#		return fall_state

	if managed.is_on_floor():
		if managed.velocity != Vector3.ZERO:
			return move_state
		return idle_state
	return null
