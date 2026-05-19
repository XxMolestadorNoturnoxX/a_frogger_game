extends Marker2D

var cor: Color
var woke_up := false
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
		#print("physics began ", Time.get_ticks_msec())
		if delay == 0:
			animation()
		if delay == 1:
			get_tree().create_timer(time/4, false, true).timeout.connect(animation)
		if delay == 2:
			get_tree().create_timer(time/2, false, true).timeout.connect(animation)
		if delay == 3:
			get_tree().create_timer(time - time/4, false, true).timeout.connect(animation)
	
func animation():
	if woke_up:
		#print("started ", delay, " ", Time.get_ticks_msec())
		if self.can_process() == false:
			woke_up = false
		var tween := create_tween()
		tween.set_process_mode(Tween.TWEEN_PROCESS_PHYSICS)
		tween.tween_property($Sprite2D,"modulate", cor, time)
		tween.tween_callback(spawn)
#cuuuuuuuuuucucucucucucucu
func spawn():
	$Sprite2D.modulate = "ffffff00"
	blue_spawn.emit(self, index)
	#print("finished ", delay, " ", Time.get_ticks_msec())
	animation()
