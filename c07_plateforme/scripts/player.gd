extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

#@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var anim_tree: AnimationTree = $AnimationTree
@onready var state_machine: AnimationNodeStateMachinePlayback = anim_tree.get("parameters/playback")

func _ready():
	anim_tree.active = true  # Active l'AnimationTree

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("attack"):
		state_machine.travel("attack")  # On passe à l'état attack

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		state_machine.travel("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		state_machine.travel("idle")

	$SpriteSheet.flip_h = direction < 0

	move_and_slide()
