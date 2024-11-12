extends CharacterBody3D

class_name Player

@onready var health_bar: Control = $HealthBar

const SPEED = 50.0
const JUMP_VELOCITY = 4.5
var HEALTH = 100
var IS_GOD_MODE_ON = true

signal died()

func _ready():
	health_bar.set_value(HEALTH)

func _physics_process(delta: float) -> void:
	if HEALTH > 0:
		_move_player(delta)

func _move_player(delta: float) -> void:
	if not is_on_floor():
		velocity += get_gravity() * delta

	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	var input_dir := Input.get_vector("left", "right", "up", "down")
	var direction := (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()

func apply_damage(damage: int) -> void:
	if IS_GOD_MODE_ON:
		return
		
	HEALTH -= damage
	
	health_bar.set_value(HEALTH)
	
	if HEALTH <= 0:
		emit_signal("died")
