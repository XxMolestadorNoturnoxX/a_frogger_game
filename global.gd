extends Node

var velocidade = 270
var player_sprinting = false
var devagar = true
var timer: Timer
var position: Vector2 = Vector2(830,1156)
var current_pos: Vector2
var fps: int = 60:
	set(value):
		Engine.max_fps = value
var index: int = 4
var volume: int = 44
var duration: float = 0.03
var time: float = 0.0
var show_collisions: bool = false
var health: int = 100:
	set(value):
		health = value
		print(health)


func _process(delta: float) -> void:
	if devagar:
		time += delta
		if time >= duration:
			time -= duration
			velocidade = velocidade + 3
		if velocidade >= 1069:
			devagar = false
			duration = 0.02
	else:
		time += delta
		if time >= duration:
			time -= duration
			velocidade = velocidade - 3
		if velocidade <= 270:
			devagar = true
			duration = 0.03

#COOLZINHOW
