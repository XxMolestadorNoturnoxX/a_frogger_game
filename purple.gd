extends Node2D

var time_spawn := 0.0
var duration_spawn := 2.0
var vel_to_dur: Dictionary = {
	"408": 1.9,
	"447": 1.8,
	"486": 1.7,
	"525": 1.6,
	"564": 1.5,
	"603": 1.4,
	"642": 1.3,
	"681": 1.2,
	"720": 1.1,
	"759": 1.0,
	"798": 0.9,
	"837": 0.8,
	"876": 0.7,
	"915": 0.6,
	"954": 0.5,
	"993": 0.4,
	"1032": 0.3,
	"1069": 0.2
}

var devagar := true
var time := 0.0
var duration: float = 0.03
var velocidade := 270

func _physics_process(delta: float) -> void:
	var cu: float = vel_to_dur.get(str(velocidade), duration_spawn)
	duration_spawn = cu
	Global.velocidade_roxo = velocidade

	time_spawn += delta
	if time_spawn >= duration_spawn:
		for spawn in self.get_children():
			spawn.spawn()
		time_spawn -= duration_spawn

	time += delta
	if time >= duration:
		time -= duration
		if devagar:
			velocidade = velocidade + 3
		else:
			velocidade = velocidade - 3
	if velocidade >= 1069:
		devagar = false
		duration = 0.02
	if velocidade <= 270:
		devagar = true
		duration = 0.03
