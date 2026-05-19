extends Marker2D

var woke_up := false
var awake := false
@export var index: int
@export var direction: String
signal purple_spawn

func spawn():
	if awake:
		if can_process() == false:
			awake = false
			woke_up = false
		purple_spawn.emit(self, index, direction)

func _process(_delta: float) -> void:
	if woke_up == false:
		woke_up = true
		awake = true
