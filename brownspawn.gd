extends Marker2D

signal brown_spawn
@export var index: int
@export var duration: float
var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	if time >= duration:
		brown_spawn.emit(self, index)
		time -= duration
