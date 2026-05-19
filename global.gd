extends Node

#carros

signal damaged
var player_sprinting = false
var current_pos: Vector2
var velocidade_roxo: int

#coisas de menu

var fps: int = 60:
	set(value):
		Engine.max_fps = value
var index: int = 4
var volume: int = 44
var show_collisions: bool = false

#coisas de save

var health: int = 100:
	set(value):
		health = value
		damaged.emit(value)
var areas: Array = ["area1","area2"]
var gun: bool = false
var russo: bool = false
var position: Vector2 = Vector2(830,1156)
