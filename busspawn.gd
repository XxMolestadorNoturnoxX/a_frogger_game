extends Marker2D

signal bus_spawn
@export var index: int
@export var duration: float
@export var direction: String
var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	if time >= duration:
		bus_spawn.emit(self, index, direction)
		time -= duration
