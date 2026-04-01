extends Node2D

@export var speed: Vector2 = Vector2(4,2.25)

func _process(_delta: float) -> void:
	$fabicinho.position += Vector2(speed)
	$fabicinho.scale += Vector2(0.00069,0.00069)
