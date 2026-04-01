extends Control

signal restart

func _on_ragequit_button_up() -> void:
	get_tree().quit()


func _on_restart_button_up() -> void:
	restart.emit()
	queue_free()
