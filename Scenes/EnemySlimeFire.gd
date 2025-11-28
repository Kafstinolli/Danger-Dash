extends CharacterBody2D

const Speed = 100.0	
const Gravity = 980

func _ready():
	velocity.x = Speed
	$AnimatedSprite2D.play("Run")
	
func _next_to_left_wall():
	return $Left.is_colliding()

func _next_to_right_wall():
	return $Right.is_colliding()
	
func flip():
	if _next_to_left_wall() or _next_to_right_wall():
		velocity.x*=-1
		$AnimatedSprite2D.scale.x *=-1

func _physics_process(delta):
	velocity.y += Gravity
	flip()
	move_and_slide()
