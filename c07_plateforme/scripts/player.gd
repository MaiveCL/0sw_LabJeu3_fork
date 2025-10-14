extends CharacterBody2D

const SPEED = 200.0
const JUMP_VELOCITY = -400.0

#@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var anim_tree: AnimationTree = $AnimationTree
@onready var state_machine: AnimationNodeStateMachinePlayback = anim_tree.get("parameters/playback")
var current_state: String = "idle"  # garde en mémoire l'état actuel

func _ready():
	anim_tree.active = true  # Active l'AnimationTree

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		print("jump pressed !")
		velocity.y = JUMP_VELOCITY
		
	if Input.is_action_just_pressed("attack"):
		print("Attack pressed !")
		change_state("attack")  # On passe à l'état attack

	# Get the input direction and handle the movement/deceleration.
	var direction := Input.get_axis("move_left", "move_right")
	if direction:
		velocity.x = direction * SPEED
		change_state("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if current_state != "attack":
			change_state("idle")

	$SpriteSheet.flip_h = direction < 0

	move_and_slide()
	
func change_state(new_state: String) -> void:
	if current_state != new_state:
		current_state = new_state
		state_machine.travel(new_state)
		print("State changed to: ", new_state)
		
	# relayer le state machine à l'animation Tree quand en state attack
	if current_state == "attack":
		current_state = state_machine.get_current_node()
