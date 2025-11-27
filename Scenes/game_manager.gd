extends Node2D

@onready var points_label: Label = %PointsLabel
@onready var life_label: Label = %LifeLabel

var puntos = 0
var vidas = 3

func add_puntos():
	puntos += 1
	print(puntos)
	points_label.text = "$ " + str(puntos)

func add_life():
	vidas += 1
	print(vidas)
	life_label.text = "<3  " + str(vidas)
