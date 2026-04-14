extends Marker2D

signal orange_spawn
@export var index: int
@export var speed: int
@export var duration: float
@export var direction: String
var time: float = 0.0

func _physics_process(delta: float) -> void:
	time += delta
	if time >= duration:
		orange_spawn.emit(self, speed, index, direction)
		time -= duration
