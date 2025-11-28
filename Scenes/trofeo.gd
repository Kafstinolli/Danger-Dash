extends Area2D

@export var target_level : PackedScene

var trophy_sound

func _ready() -> void:
	trophy_sound = get_node("/root/UiPuntos/TrophyAudio")

func _on_body_entered(body: Node2D) -> void:
	if (body.name == "CharacterBody2D"):
		trophy_sound.playing = true
		get_tree().change_scene_to_packed(target_level)
