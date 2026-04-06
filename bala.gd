extends Area2D

var speed = 469
var direction: Vector2

func _physics_process(delta: float) -> void:
	position += direction * speed * delta

func _on_area_entered(area: Area2D) -> void:
	var layer = area.get_collision_layer_value(7)
	if layer == true:
		area.queue_free()
	queue_free()


func _on_body_entered(body: Node2D) -> void:
	if body.collision_layer == 1:
		queue_free()
