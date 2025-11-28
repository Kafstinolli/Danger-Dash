extends Node

var ui_node
var game_audio

func _ready() -> void:
	ui_node = get_node("/root/UiPuntos")
	ui_node.hide()
	
	# Referencia a la música de fondo en la escena UI
	game_audio = get_node("/root/UiPuntos/GameAudio")
	game_audio.stop()  # Detiene la música mientras se está en el menú

	
func _exit_tree() -> void:
	ui_node.show()
	game_audio.play()  # Reanuda la música al salir del menú

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/nivelUno.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/nivelDos.tscn")
