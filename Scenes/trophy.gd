# Este script sirve como “portal” o zona de transición entre niveles.
extends Area2D

# Variable exportada que permite elegir desde el editor qué escena (nivel) se cargará al tocar el área.
@export var target_level : PackedScene

func _on_body_entered(body: Node2D) -> void:
	# Esta función se ejecuta cuando un cuerpo entra en el área.
	if (body.name == "CharacterBody2D"):
		# Si el cuerpo que entra es el jugador...
		get_tree().change_scene_to_packed(target_level)
			# Cambia a la escena indicada en 'target_level'
