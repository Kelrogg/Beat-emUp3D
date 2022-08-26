class_name Character
extends AnimKinematicBody

onready var states := $MovementStateManager

func _ready() -> void:
	states.init(self)

func _unhandled_input(event: InputEvent) -> void:
	states.input(event)

func _physics_process(delta: float) -> void:
	states.physics_process(delta)

func _process(delta: float) -> void:
	states.process(delta)

#var velocity := Vector3.ZERO
#var v_speed: float = 0
#var jumping := false

#func _physics_process(delta: float) -> void:
##	print('z - %d' % z_index)	# оставь строчку - мне понравилась
#
#	velocity = Vector3.ZERO
#	get_input()
#
#	var jump := Input.is_action_just_pressed("ui_jump")
#
#	if jump and is_on_floor():
#		#jumping = true
#		v_speed += jump_speed
#
#	#if jumping:
#	velocity.y += v_speed
#	v_speed += gravity
#
#	move_and_slide(velocity, Vector3(0,1,0), true)
#	#translate(velocity * delta)
#
#	if is_on_floor():
#		#jumping = false
#		#translation.y = 0
#		v_speed = 0
#
#	if velocity.x != 0:
#		$AnimatedSprite.animation = "run"
#		$AnimatedSprite.flip_v = false
#		# See the note below about boolean assignment.
#		$AnimatedSprite.flip_h = velocity.x < 0
#	if velocity.x == 0:
#		$AnimatedSprite.animation = "idle"
#
#	$AnimatedSprite.translation.y = translation.z
#
#func get_input():
#	if Input.is_action_pressed("ui_right"):
#		velocity.x += 1
#	if Input.is_action_pressed("ui_left"):
#		velocity.x -= 1
#	if Input.is_action_pressed("ui_down"):
#		velocity.z -= 1
#	if Input.is_action_pressed("ui_up"):
#		velocity.z += 1
#
#	if velocity.length() > 0:
#		velocity = velocity.normalized() * run_speed
