extends Marker2D


signal glitched_spawn
@export var time: int
@export var index: int
var t: int = 0
@export var speed: int

func _process(_delta: float) -> void:
	t += 1
	if t >= time:
		t -= time
		glitched_spawn.emit(self, speed, index)
