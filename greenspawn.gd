extends Marker2D

signal green_spawn
@export var index: int
@export var duration: float
var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	if time >= duration:
		green_spawn.emit(self, index)
		time -= duration
