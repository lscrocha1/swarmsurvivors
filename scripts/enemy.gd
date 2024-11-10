extends CharacterBody3D

class_name Enemy

@onready var player: Player = %Player

const ENEMY_SPEED = 25.0
const DAMAGE = 5;

func _process(delta: float) -> void:
	var velocity = global_position.direction_to(player.global_position)
	var collided = move_and_collide(velocity * ENEMY_SPEED * delta)
	
	if collided:
		player.apply_damage(DAMAGE)
	
