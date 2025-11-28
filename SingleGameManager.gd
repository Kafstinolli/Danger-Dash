extends Node

var points_label
var texture_progress_bar
var life_label
var puntos = 0
var vidas = 3

func _ready() -> void:
	points_label = get_node("/root/UiPuntos/Panel/PointsLabel")
	texture_progress_bar = get_node("/root/UiPuntos/TextureRect/TextureProgressBar")
	life_label = get_node("/root/UiPuntos/Panel2/LifeLabel")
	
func add_puntos():
	puntos += 1
	print(puntos)
	points_label.text = "  " + str(puntos)
	texture_progress_bar.value += 1
	
func add_life():
	vidas += 1
	print(vidas)
	life_label.text = "  " + str(vidas)
