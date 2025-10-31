# Este script controla el movimiento del personaje y la cámara.
extends CharacterBody2D

@onready var jump_label: Label = %JumpLabel

# Constantes: velocidad del personaje y fuerza del salto.
const SPEED = 300.0
const JUMP_VELOCITY = -1000.0

# Variables que referencian nodos del personaje (sprite, temporizadores y cámara).
@onready var sprite_2d = $Sprite2D 
@onready var timer = $Timer
@onready var cam = $Camera2D
@onready var cam_timer = $CamTimer

# Variables para controlar el movimiento automático de la cámara.
var accum = 0
var itera = 0
var conta = 0
var maxim = 460
var steps = 40

# Se ejecuta en cada frame de física (control principal del personaje).
func _physics_process(delta: float) -> void:
	
	if Input.is_action_just_pressed("Recorrido"):
		CameraMove()
	
	if Input.is_action_just_pressed("zoomIn"):
		if(cam.zoom<=Vector2(2,2)):
			cam.zoom=cam.zoom+Vector2(.1,.1) 
		
	if Input.is_action_just_pressed("zoomOut"): 
		if(cam.zoom>=Vector2(0.5,0.5)):
			cam.zoom=cam.zoom-Vector2(0.2,0.2)

	# Cambia la animación del personaje si se mueve o está quieto.
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "Run"
	else:
		sprite_2d.animation = "Idle"
	
	# Aplica gravedad si el personaje no está en el suelo.
	if not is_on_floor():
		velocity += get_gravity() * delta
		sprite_2d.animation = "Jump"
		
	# Permite saltar si está en el suelo o acaba de salir del borde.
	if Input.is_action_just_pressed("jump") and (is_on_floor() or timer.time_left > 0.0):
		velocity.y = JUMP_VELOCITY
		jump_label.text = str(int(jump_label.text) +1)
		$JumpSound.play()

	# Movimiento lateral (izquierda/derecha).
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 10) # Detiene gradualmente al personaje.
		
	var was_on_floor = is_on_floor()
	
	move_and_slide() # Aplica el movimiento con colisiones.
	
	# Detecta si acaba de salir del suelo (para saltos más naturales).
	var just_left_ledge = was_on_floor and not is_on_floor() and velocity.y >= 0
	
	if just_left_ledge:
		timer.start()  # Inicia un pequeño margen para permitir saltos al borde.
	
	var isLeft = velocity.x < 0
	sprite_2d.flip_h = isLeft # Voltea el sprite si va hacia la izquierda.
	
func CameraMove():
		# Reinicia los contadores y comienza el movimiento de la cámara.
		itera = 0
		conta = 0
		accum = 0
		cam_timer.start() # Activa el temporizador que mueve la cámara.
		cam.drag_horizontal_enabled = false # Desactiva el arrastre manual de cámara.

# Función que se ejecuta cada vez que se activa el temporizador de cámara.
func _on_cam_timer_timeout() -> void:
	if itera <= maxim:
		# Mueve la cámara hacia la derecha poco a poco.
		accum += 20
		cam.position = Vector2(accum, 0)
		itera += 1
	else:
		# Luego la mueve de vuelta hacia la izquierda.
		if cam.position.x > 0:
			accum -= 20
			cam.position = Vector2(accum, 0)
			conta += 1
			
			# Cuando termina el recorrido, detiene el temporizador y reactiva el arrastre manual.
			if conta >= maxim:
				cam_timer.stop()
				cam.drag_horizontal_enabled = true




	
	
