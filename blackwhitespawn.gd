extends Marker2D

signal blwh_spawn
var white = false:
	set(value):
			if value == true:
				changed_to_white = true
			if value == false:
				changed_to_black = true

var changed_to_white: bool = false
var changed_to_black: bool = false
@export var time: float
var t: float = 0.0
@export var index: int
@export var direction: String

func _physics_process(delta: float) -> void:
	if changed_to_white:
		time = time / 3
		t = t / 3
		changed_to_white = false
	
	if changed_to_black:
		time = time * 3
		t = t * 3
		changed_to_black = false
		
	t += delta
	if t >= time:
		blwh_spawn.emit(self, index, direction)
		t -= time
