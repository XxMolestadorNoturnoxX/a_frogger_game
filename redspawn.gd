extends Marker2D

signal red_spawn
@export var index: int
@export var duration: float
var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	if time >= duration:
		red_spawn.emit(self, index)
		time -= duration
