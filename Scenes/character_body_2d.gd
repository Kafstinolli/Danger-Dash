extends CharacterBody2D

const SPEED := 400.0
const JUMP_VELOCITY := -700.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta: float) -> void:
	# --- Movimiento horizontal ---
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)

	# --- Flip visual ---
	sprite_2d.flip_h = velocity.x < 0

	# --- Gravedad ---
	if not is_on_floor():
		velocity.y += gravity * delta

	# --- Saltar ---
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# --- Animaciones ---
	if not is_on_floor():
		sprite_2d.animation = "Jump"
	elif abs(velocity.x) > 1:
		sprite_2d.animation = "Run"
	else:
		sprite_2d.animation = "Idle"

	# --- Movimiento final ---
	move_and_slide()
