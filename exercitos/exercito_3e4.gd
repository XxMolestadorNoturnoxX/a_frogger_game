extends Control

var numero: Array = [0,1,2,3,4,5,6,7,8,9]
var cores: Array = ["ff0000", "00ff00", "0000ff", "ffff00", "ff00ff", "00ffff", "00ffbb", "fe3867", "696969", "6f3400"]
var tamanho: Vector2 = Vector2(90,160)
var indo_direita: bool = true
var indo_esquerda: bool = false
var subindo: bool = false
var descendo: bool = true
var limite_direita = 819
var limite_esquerda = 333
var limite_baixo = 548
var limite_cima = 384

func _process(_delta: float) -> void:
	if indo_direita && $nuvem.position.x < limite_direita:
		$nuvem.position.x += 2
	elif $nuvem.position.x >= limite_direita:
		trocar_cor()
		indo_direita = false
		indo_esquerda = true
	if indo_esquerda && $nuvem.position.x > limite_esquerda:
		$nuvem.position.x -= 2
	elif $nuvem.position.x <= limite_esquerda:
		trocar_cor()
		indo_esquerda = false
		indo_direita = true
	if descendo && $nuvem.position.y < limite_baixo:
		$nuvem.position.y += 2
	elif $nuvem.position.y >= limite_baixo:
		trocar_cor()
		descendo = false
		subindo = true
	if subindo && $nuvem.position.y > limite_cima:
		$nuvem.position.y -= 2
	elif $nuvem.position.y <= limite_cima:
		trocar_cor()
		subindo = false
		descendo = true

func trocar_cor():
	var cor: Color = cores.pick_random()
	if cor == $nuvem.modulate:
		trocar_cor()
	else:
		$nuvem.modulate = cor
