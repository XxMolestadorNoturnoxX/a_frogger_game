extends CharacterBody2D

var speed := 400
var inside := false
var calmdown := false
var inverso := false
var berserk := false
var alinhado_y := false
var alinhado_x := false
var showing_hitbox := false

func _ready() -> void:
	$NavigationAgent2D.target_position = Global.current_pos
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 84
	$invertedor/Skeleton2D.hide()

func _physics_process(_delta: float) -> void:
	if berserk:
		var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction := (next_path_pos - global_position).normalized()
		velocity = direction * speed
		if direction.x < 0 and inverso == false:
			inverso = true
			$flipping.play("flip")
		if direction.x > 0 and inverso:
			inverso = false
			$flipping.play("pilf")
		move_and_slide()
	if abs(abs(global_position.y) - abs(Global.current_pos.y)) < 30:
		alinhado_y = true
	elif alinhado_y == true:
		alinhado_y = false
		speed = 150
	if abs(abs(global_position.x) - abs(Global.current_pos.x)) < 10:
		alinhado_x = true
	elif alinhado_x == true:
		alinhado_x = false
		showing_hitbox = false
	if alinhado_y and alinhado_x:
		speed = -169
		teleport(speed)
	if not showing_hitbox and Global.show_collisions == true:
		$"invertedor/Skeleton2D/Russ/ombro?/faca/dano/colisao".show()
		showing_hitbox = true
	if showing_hitbox and Global.show_collisions == false:
		$"invertedor/Skeleton2D/Russ/ombro?/faca/dano/colisao".hide()


func _on_caminho_timeout() -> void:
	$NavigationAgent2D.target_position = Global.current_pos


func _on_facada_body_entered(_body: Node2D) -> void:
	if berserk:
		inside = true
		if not inverso:
			$knifing.play("facada")
		else:
			$knifing.play("adacaf")
		speed = 350


func _on_facada_body_exited(_body: Node2D) -> void:
	inside = false
	$knifing.stop()
	speed = 400


func _on_fast_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 2, 0.5)
	speed = 300


func _on_fast_body_exited(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 1, 0.5)
	speed = 350


func _on_very_fast_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 4, 0.5)
	speed = 250


func _on_very_fast_body_exited(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 2, 0.5)
	speed = 300


func _on_dano_body_entered(_body: Node2D) -> void:
	if calmdown == false:
		Global.health -= 4
		$"../ABOMINATION/test/health".text = "health: " + str(Global.health)
		calmdown = true
		await get_tree().create_timer(0.05).timeout
		calmdown = false


func _on_very_very_very_fest_body_entered(_body: Node2D) -> void:
	var tween := get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 8, 0.5)
	speed = 150


func _on_very_very_very_fest_body_exited(_body: Node2D) -> void:
	var tween := get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 4, 0.5)
	speed = 250

#func flip(caller):
	#if caller == "flip":
		#$invertedor.scale.x = -1
		#$Marker2D.position.x = -178
	#if caller == "plif":
		#$invertedor.scale.x = 1
		#$Marker2D.position.x = 178

func teleport(current_speed):
	var direita_esquerda: Array = ["esq","dir"]
	var lado = direita_esquerda.pick_random()
	var cima_baixo: Array = ["em cima", "baixo"]
	var altura = cima_baixo.pick_random()
	var value_x: int
	var value_y: int
	speed = 0
	if lado == "esq":
		value_x = randi_range(-369,-269)
	else:
		value_x = randi_range(369,269)
	if altura == "em cima":
		value_y = randi_range(-369,-269)
	else:
		value_y = randi_range(369,269)
	if berserk == false:
		value_x = 0
		value_y = 390
		berserk = true
	global_position = Vector2(Global.current_pos.x + value_x, Global.current_pos.y + value_y)
	$invertedor/Skeleton2D.show()
	if not inverso:
		$knifing.play("facada")
	else:
		$knifing.play("adacaf")
	speed = current_speed

func ackorda() -> void:
	teleport(speed)


func _on_limit_body_exited(body: Node2D) -> void:
	print("saiu")
	if body.has_method("dano"):
		teleport(speed)


func _on_flipping_current_animation_changed(cu: StringName) -> void:
	if cu == "flip":
		$invertedor.scale.x = -1
		$Marker2D.position.x = -178
		$"invertedor/Skeleton2D".show()
		print(cu)
	if cu == "pilf":
		$invertedor.scale.x = 1
		$Marker2D.position.x = 178
		$"invertedor/Skeleton2D".show()
		print(cu)
