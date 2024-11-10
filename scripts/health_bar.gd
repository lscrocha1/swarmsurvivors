extends Control

class_name HealthBar

@onready var progress_bar: ProgressBar = $ProgressBar

const MAX_VALUE = 100
const MIN_VALUE = 0

func set_value(value: int) -> void:
	if value > MAX_VALUE:
		value = MAX_VALUE
	
	if value < MIN_VALUE:
		value = MIN_VALUE
	
	progress_bar.value = value
