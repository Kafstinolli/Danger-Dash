# Este script controla la puntuación del juego.
extends Node2D

# Referencia al nodo Label que muestra los puntos en pantalla.
@onready var points_label: Label = %PointsLabel

# Variable que guarda el número total de puntos.
var puntos = 0

func add_puntos():
	# Cada vez que se llama a esta función:
	puntos += 1 # Suma 1 punto.
	print(puntos) # Muestra el total actual en la consola (solo para verificar).
	points_label.text = str(puntos)# Actualiza el texto del Label con el nuevo puntaje.
