extends CharacterBody2D

const SPEED := 400.0
const JUMP_VELOCITY := -700.0

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D
@onready var timer = $Timer
@onready var cam: Camera2D = $Camera2D
@onready var cam_timer: Timer = $CamTimer
@onready var jump_label: Label = %JumpLabel

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

var accum = 0
var itera = 0
var conta = 0
var maxim = 80
var steps = 160

func _ready() -> void:
	jump_label = get_node("/root/UiPuntos/AnimatedSprite2D/JumpLabel")

func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Recorrido"):
		CameraMove()
		
	if Input.is_action_just_pressed("zoomOut"):
		cam.zoom.x = clamp(cam.zoom.x - 0.2, 0.5, 2.0)
		cam.zoom.y = clamp(cam.zoom.y - 0.2, 0.5, 2.0)

	if Input.is_action_just_pressed("zoomIn"):
		cam.zoom.x = clamp(cam.zoom.x + 0.2, 0.5, 2.0)
		cam.zoom.y = clamp(cam.zoom.y + 0.2, 0.5, 2.0)


	# Movimiento horizontal
	var direction := Input.get_axis("left", "right")
	if direction != 0:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10)

	sprite_2d.flip_h = velocity.x < 0

	# Gravedad
	if not is_on_floor():
		velocity.y += gravity * delta
	
	# Saltar
	if Input.is_action_just_pressed("jump") and (is_on_floor() or timer.time_left > 0.0):
		velocity.y = JUMP_VELOCITY
		jump_label.text = str(int(jump_label.text) + 1 )
	# Animaciones
	if not is_on_floor():
		sprite_2d.animation = "Jump"
	elif abs(velocity.x) > 1:
		sprite_2d.animation = "Run"
	else:
		sprite_2d.animation = "Idle"

	var was_on_floor = is_on_floor()

	move_and_slide()

	var just_left_ledge = was_on_floor and not is_on_floor() and velocity.y >= 0
	if just_left_ledge:
		timer.start()

func CameraMove():
	itera = 0
	conta = 0
	accum = 0
	cam_timer.start()
	cam.drag_horizontal_enabled = false

func _on_cam_timer_timeout() -> void:
	if itera <= maxim:
		accum += 90
		cam.position = Vector2(accum, 0)
		itera += 1
	else:
		if cam.position.x > 0:
			accum -= 90
			cam.position = Vector2(accum, 0)
			conta += 1
			
			if conta >= maxim:
				cam_timer.stop()
				cam.drag_horizontal_enabled = true
				
