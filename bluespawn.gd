extends Marker2D

var cor: Color
var woke_up: bool = false
signal blue_spawn
@export var index: int
@export var time: float
@export var delay: int

func _ready() -> void:
	cor.r = 255
	cor.g = 0
	cor.b = 0
	cor.a = 0.5

func _physics_process(_delta: float) -> void:
	if woke_up == false:
		woke_up = true
		if delay == 0:
			animation()
		if delay == 1:
			get_tree().create_timer(time/4).timeout.connect(animation)
		if delay == 2:
			get_tree().create_timer(time/2).timeout.connect(animation)
		if delay == 3:
			get_tree().create_timer(time - time/4).timeout.connect(animation)
	
func animation():
	var tween = get_tree().create_tween().set_loops()
	tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
	tween.tween_property($Sprite2D,"modulate", cor, time)
	tween.tween_callback(spawn)
#cuuuuuuuuuucucucucucucucu
func spawn():
	$Sprite2D.modulate = "ffffff00"
	blue_spawn.emit(self, index)
