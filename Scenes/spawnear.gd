extends Node2D

@onready var timer = $Timer
@onready var cherry_scene = preload("res://Scenes/collectible.tscn")
var current_cherry = null

func _ready():
	timer.wait_time = 3
	timer.one_shot = true
	timer.start()

func _on_timer_timeout():
	if current_cherry == null:
		var new_cherry = cherry_scene.instantiate()
		add_child(new_cherry)
		current_cherry = new_cherry
		new_cherry.connect("collected", Callable(self, "_on_cherry_collected"))

func _on_cherry_collected():
	current_cherry = null
	timer.start()
