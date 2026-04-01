extends Marker2D

var woke_up: bool = false
var awake: bool = false
@export var index: int
signal purple_spawn

func spawn():
	if awake:
		purple_spawn.emit(self, index)

func _process(_delta: float) -> void:
	if woke_up == false:
		woke_up = true
		awake = true
