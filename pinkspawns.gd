extends Marker2D

var woke_up: bool = false
var awake: bool = false
@export var index: int
@export var direction: String
signal pink_spawn

func spawn():
	if awake:
		pink_spawn.emit(self, index, direction)

func _process(_delta: float) -> void:
	if woke_up == false:
		woke_up = true
		awake = true
