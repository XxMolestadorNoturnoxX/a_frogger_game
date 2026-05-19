extends CharacterBody2D

var speed := 369
var stop := 1
var cudown := false
var showing_hitbox := false
var bullet_pos: Vector2
var bullet_dir: Vector2
var bullet_rot: float
signal correr
signal andar
signal shoot(bullet_pos, bullet_dir, bullet_rot)

func _ready() -> void:
	Global.connect("damaged", dano)
	if Global.russo == false:
		stop = 0
		cudown = true
		self.modulate = Color.RED
		await get_tree().create_timer(0.2).timeout
		self.modulate = Color.YELLOW
		await get_tree().create_timer(0.2).timeout
		self.modulate = Color.GREEN
		await get_tree().create_timer(0.2).timeout
		self.modulate = Color.WHITE
		stop = 1
		cudown = false
		$"..".on_menu = false

func _physics_process(_delta: float) -> void:
	if Global.gun:
		bullet_pos = $eixo/spawner.global_position
		bullet_dir = (get_global_mouse_position() - global_position).normalized()
		bullet_rot = bullet_dir.angle()
		$eixo.look_at(get_global_mouse_position())
	if Input.is_action_pressed("shoot") and Global.gun and cudown == false:
		cudown = true
		shoot.emit(bullet_pos,bullet_dir, bullet_rot)
		$cudown.start()
	var direction := Input.get_vector("left","right","up","down")
	velocity = speed * direction * stop
	move_and_slide()
	if Input.is_action_pressed("sprint"):
		speed = 369 + Global.health * 2
		correr.emit()
		Global.player_sprinting = true
	else:
		speed = 269 + Global.health
		andar.emit()
		Global.player_sprinting = false
	Global.current_pos = global_position
	if showing_hitbox == false and Global.show_collisions:
		$colisao.show()
		showing_hitbox = true
	if showing_hitbox and not Global.show_collisions:
		$colisao.hide()
		showing_hitbox = false

#CU CU CU CU CU CU CU CU 
#ZINCO ZINCO ZINCO ZIN


func _on_cudown_timeout() -> void:
	cudown = false


func _on_arma_collect() -> void:
	Global.gun = true
	$eixo.show()

func russo():
	cudown = true
	stop = 0
	var tween := create_tween()
	await tween.tween_property($Camera, "offset", Vector2(0,-369), 2).finished
	DialogueManager.show_dialogue_balloon_scene("res://balloon.tscn", load("res://russo.dialogue"), "start")
	
func chase():
	cudown = false
	stop = 1
	$"..".on_menu = false
	self.modulate = Color.WHITE
	var tween := create_tween()
	tween.tween_property($Camera, "offset", Vector2(0,0), 0.5)

func dano(value):
	$sangue.modulate = Color.from_rgba8(255,255,255, 255 - value * 2)
	$Sprite2D.modulate = Color.from_rgba8(255, 200 + value/2 , 200 + value/2)
	print("cu")
	print($sangue.modulate)
