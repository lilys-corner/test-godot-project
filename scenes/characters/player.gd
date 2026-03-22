extends CharacterBody2D

var direction: Vector2
var speed := 50

@onready var move_state_machine = $Animation/AnimationTree.get("parameters/MoveStateMachine/playback")

func _physics_process(_delta: float) -> void:
	move()
	animate()

func move():
	direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	move_and_slide()

func animate():
	if direction:
		move_state_machine.travel('Walk')
		var direction_animation = Vector2(round(direction.x), round(direction.y))
		$Animation/AnimationTree.set("parameters/MoveStateMachine/Idle/blend_position", direction_animation)
		$Animation/AnimationTree.set("parameters/MoveStateMachine/Walk/blend_position", direction_animation)
	else:
		move_state_machine.travel('Idle')
		
		
func tool_use_emit():
	print('tool')
