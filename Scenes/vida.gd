extends Area2D

var life_sound

func _ready() -> void:
	life_sound = get_node("/root/UiPuntos/LifeAudio")
	
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		life_sound.playing = true
		SingleGameManager.add_life()
		queue_free()
