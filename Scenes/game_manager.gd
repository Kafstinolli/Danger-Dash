extends Node2D

@onready var points_label: Label = %PointsLabel
@onready var life_label: Label = %LifeLabel
@onready var texture_progress_bar: TextureProgressBar = %TextureProgressBar

var puntos = 0
var vidas = 3

func add_puntos():
	puntos += 1
	print(puntos)
	points_label.text = "  " + str(puntos)
	texture_progress_bar.value += 1

func add_life():
	vidas += 1
	print(vidas)
	life_label.text = "  " + str(vidas)
