extends Marker2D

var cor: Color
var woke_up: bool = false
signal blue_spawn
@export var index: int
@export var time: float

func _ready() -> void:
	cor.r = 255
	cor.g = 0
	cor.b = 0
	cor.a = 0.5

func _process(_delta: float) -> void:
	if woke_up == false:
		woke_up = true
		spawn()
	
func spawn():
	var tween = get_tree().create_tween()
	await tween.tween_property($Sprite2D,"modulate", cor, time).finished
	$Sprite2D.modulate = "ffffff00"
	blue_spawn.emit(self, index)
	spawn()
#cuuuuuuuuuucucucucucucucu
