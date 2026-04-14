extends Marker2D

signal yellow_spawn
@export var index: int
@export var duration: float
@export var direction: String
var time: float = 0.0

func _physics_process(delta: float) -> void:
	time += delta
	if time >= duration:
		yellow_spawn.emit(self, index, direction)
		time -= duration
