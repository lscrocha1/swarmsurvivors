extends Control

signal start_again_clicked()

func _on_button_pressed() -> void:
	emit_signal("start_again_clicked")
