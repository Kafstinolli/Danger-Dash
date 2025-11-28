extends Node2D

@onready var timer = $Timer
@onready var coin_scene = preload("res://Scenes/moneda.tscn")

var current_coin: Node = null

func _ready() -> void:
	timer.one_shot = true
	_start_timer()

func _start_timer() -> void:
	timer.wait_time = 3
	timer.start()
	

func _on_coin_collected() -> void:
	current_coin = null
	_start_timer()

func _on_timer_timeout() -> void:
	if current_coin == null:
		var new_coin = coin_scene.instantiate()
		add_child(new_coin)
		current_coin = new_coin

		new_coin.connect("collected", Callable(self, "_on_coin_collected"))
