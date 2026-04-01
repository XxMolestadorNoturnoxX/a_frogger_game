extends Area2D

var player_in = false
signal collect
func _process(_delta: float) -> void:
	
	if Input.is_action_just_pressed("interact") and player_in == true:
		collect.emit()
		queue_free()


func _on_area_2d_body_entered(_body: Node2D) -> void:
	player_in = true


func _on_area_2d_body_exited(_body: Node2D) -> void:
	player_in = false
