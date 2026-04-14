extends CharacterBody2D

var speed: int = 400
var inside: bool = false
var calmdown: bool = false
var inverso: bool = false
var berserk: bool = false

func _ready() -> void:
	$NavigationAgent2D.target_position = Global.current_pos
	$NavigationAgent2D.path_desired_distance = 4.0
	$NavigationAgent2D.target_desired_distance = 20
	$"Skeleton2D/Russ/ombro?".hide()

func _physics_process(_delta: float) -> void:
	if berserk:
		var next_path_pos: Vector2 = $NavigationAgent2D.get_next_path_position()
		var direction: Vector2 = (next_path_pos - global_position).normalized()
		velocity = direction * speed
		if direction.x < 0 and inverso == false:
			inverso = true
			$flipping.play("flip")
		if direction.x > 0 and inverso:
			inverso = false
			$flipping.play("pilf")
		move_and_slide()


func _on_caminho_timeout() -> void:
	$NavigationAgent2D.target_position = Global.current_pos


func _on_facada_body_entered(_body: Node2D) -> void:
	if berserk:
		inside = true
		$knifing.play("facada")
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
		Global.health -= 1
		calmdown = true
		await get_tree().create_timer(0.05).timeout
		calmdown = false


func _on_very_very_very_fest_body_entered(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 8, 0.5)
	speed = 150


func _on_very_very_very_fest_body_exited(_body: Node2D) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property($knifing, "speed_scale", 4, 0.5)
	speed = 250

func flip(caller):
	if berserk == false:
		global_position.y = Global.current_pos.y + 390
		$"Skeleton2D/Russ/ombro?".show()
		$flipping.play("pilf_2")
		$knifing.play("facada")
		berserk = true
		return
	if caller == "flip":
		scale.y = -0.69
		rotation_degrees = 180
		$flipping.play("flip_2")
		return
	if caller == "plif":
		scale.y = 0.69
		rotation_degrees = 0
		$flipping.play("pilf_2")


func ackorda() -> void:
	$flipping.play("flip")
