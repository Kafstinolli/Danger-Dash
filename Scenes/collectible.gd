# Este script se usa para detectar cuando el personaje toca un área (por ejemplo, una moneda o ítem).
extends Area2D

var coin_sound

func _ready():
	coin_sound = get_node("/root/Node/CoinSound")

# Esta función se ejecuta cuando otro cuerpo (body) entra en el área.
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		# Si el objeto que entra es el jugador:
		SingleGameManager.add_puntos() # Llama al método que suma puntos.
		coin_sound.playing = true
		queue_free()  # Elimina este objeto de la escena (la cereza desaparece).
