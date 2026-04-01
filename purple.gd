extends Node2D

var time : float = 0.0
var duration = 2

func _process(delta: float) -> void:
	if Global.velocidade == 408:
		duration = 1.9
	if Global.velocidade == 447:
		duration = 1.8
	if Global.velocidade == 486:
		duration = 1.7
	if Global.velocidade == 525:
		duration = 1.6
	if Global.velocidade == 564:
		duration = 1.5
	if Global.velocidade == 603:
		duration = 1.4
	if Global.velocidade == 642:
		duration = 1.3
	if Global.velocidade == 681:
		duration = 1.2
	if Global.velocidade == 720:
		duration = 1.1
	if Global.velocidade == 759:
		duration = 1.0
	if Global.velocidade == 798:
		duration = 0.9
	if Global.velocidade == 837:
		duration = 0.8
	if Global.velocidade == 876:
		duration = 0.7
	if Global.velocidade == 915:
		duration = 0.6
	if Global.velocidade == 954:
		duration = 0.5
	if Global.velocidade == 993:
		duration = 0.4
	if Global.velocidade == 1032:
		duration = 0.3
	if Global.velocidade == 1069:
		duration = 0.2
	time += delta
	if time >= duration:
		for spawn in self.get_children():
			spawn.spawn()
		time -= duration
