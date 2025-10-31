# Este script se usa para detectar cuando el personaje toca un área (por ejemplo, una moneda o ítem).
extends Area2D

# Referencia al texto donde se muestran los puntos (aunque aquí no se usa directamente).
@onready var points_label: Label = %PointsLabel

# Esta función se ejecuta cuando otro cuerpo (body) entra en el área.
func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		# Si el objeto que entra es el jugador:
		SingleGameManager.add_puntos() # Llama al método que suma puntos.
		queue_free()  # Elimina este objeto de la escena (la cereza desaparece).
