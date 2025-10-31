# Este script se usa para detectar cuando el personaje toca un área (por ejemplo, una moneda o ítem).
extends Area2D

signal collected  #  señal para avisar al nodo principal

var coin_sound

func _ready():
	coin_sound = get_node("/root/Ui/CoinSound")

# Esta función se ejecuta cuando otro cuerpo (body) entra en el área.
func _on_body_entered(body: Node2D) -> void:
	
		SingleGameManager.add_puntos()  # Llama al método que suma puntos.
		coin_sound.playing = true
		
		emit_signal("collected")  #  Avisar al nodo principal
		queue_free()  # Elimina este objeto de la escena (la cereza desaparece)
