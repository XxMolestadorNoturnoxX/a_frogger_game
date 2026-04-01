extends Node2D

var duration = 0.035 #1,69 / spawns 
var time: float = 0.0

func _process(delta: float) -> void:
	time += delta
	if time >= duration:
		var spawn_point = self.get_children().pick_random()
		spawn_point.spawn()
		time -= duration
