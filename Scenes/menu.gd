# Este script se usa normalmente en un menú principal para cambiar entre escenas (niveles del juego).
extends Node

var ui_node

func _ready():
	ui_node = get_node("/root/Ui")
	ui_node.hide()

func _exit_tree():
	ui_node.show()

func _on_nivel_1_pressed() -> void:
	# Se ejecuta cuando el botón "Nivel 1" es presionado.
	get_tree().change_scene_to_file("res://Scenes/nivel1.tscn")
	# Cambia la escena actual y carga el nivel 1.

func _on_nivel_2_pressed() -> void:
	# Se ejecuta cuando el botón "Nivel 2" es presionado.
	get_tree().change_scene_to_file("res://Scenes/nivel2.tscn")
	# Cambia la escena actual y carga el nivel 2.
