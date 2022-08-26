extends MoveState

export (NodePath) var move_node

onready var move_state: BaseState = get_node(move_node)

func physics_process(delta: float) -> BaseState:
	var new_state = .physics_process(delta)
	if new_state:
		return new_state
	
	if managed.is_on_floor():
		if managed.velocity != Vector3.ZERO:
			return move_state
		return idle_state
	return null
	
