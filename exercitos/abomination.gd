extends CharacterBody2D

var speed = 369
var stop = 1
var Rhuan_in = false
var cudown = false
var showing_hitbox: bool = false
signal correr
signal andar

func _physics_process(_delta: float) -> void:
	if Input.is_action_pressed("rotate_right") and cudown == false:
		$eixo.rotation_degrees = 90
		cudown = true
		$cudown.start()
	if Input.is_action_pressed("rotate_down") and cudown == false:
		$eixo.rotation_degrees = 180
		cudown = true
		$cudown.start()
	if Input.is_action_pressed("rotate_left") and cudown == false:
		$eixo.rotation_degrees = -90
		cudown = true
		$cudown.start()
	if Input.is_action_pressed("rotate_up") and cudown == false:
		$eixo.rotation_degrees = 0
		cudown = true
		$cudown.start()
	var direction = Input.get_vector("left","right","up","down")
	velocity = speed * direction * stop
	move_and_slide()
	if Input.is_action_pressed("sprint"):
		speed = 569
		correr.emit()
		Global.player_sprinting = true
	else:
		speed = 369
		andar.emit()
		Global.player_sprinting = false
	Global.current_pos = global_position
	print(Engine.get_frames_per_second())
	if showing_hitbox == false and Global.show_collisions:
		$colisao.show()
		showing_hitbox = true
	if showing_hitbox and Global.show_collisions == false:
		$colisao.hide()
		showing_hitbox = false

#CU CU CU CU CU CU CU CU 
#ZINCO ZINCO ZINCO ZIN


func _on_rhuan_collect() -> void:
	Rhuan_in = true
	$eixo.show()


func _on_rhuan_area_entered(area: Area2D) -> void:
	if Rhuan_in:
		area.queue_free()


func _on_cudown_timeout() -> void:
	cudown = false
