extends Node

var ui_node

func _ready() -> void:
	ui_node = get_node("/root/UiPuntos")
	ui_node.hide()
	
func _exit_tree() -> void:
	ui_node.show()

func _on_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/nivelUno.tscn")

func _on_button_2_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/nivelDos.tscn")
