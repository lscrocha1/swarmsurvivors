extends CharacterBody3D

@onready var player: Player = %Player

const ENEMY_SPEED = 25.0

func _process(delta: float) -> void:
	position = position.move_toward(player.position, delta * ENEMY_SPEED)
	pass
