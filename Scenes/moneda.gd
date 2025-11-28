extends Area2D

var coin_sound

signal collected

func _ready() -> void:
	coin_sound = get_node("/root/UiPuntos/CoinAudio")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		SingleGameManager.add_puntos()
		coin_sound.playing = true
		emit_signal("collected")
		queue_free()
		
		
