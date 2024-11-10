extends Node

class_name GameManager

@onready var player: Player = %Player
@onready var game_over_screen: Control = %GameOverScreen

func _ready() -> void:
	player.died.connect(_game_over)
	game_over_screen.start_again_clicked.connect(_handle_start_again)

func _game_over() -> void:
	game_over_screen.visible = true

func _handle_start_again() -> void:
	get_tree().reload_current_scene()
