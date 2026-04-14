extends Area2D

var speed = 269
var rotation_speed: float = PI * 0.4
var following: bool = false
var direction: String = "left"
var showing_hitbox: bool = false
signal game_over


func _ready() -> void:
	if position.x == -400:
		direction = "right"
	if direction == "left":
		self.scale.x = -1
	await get_tree().create_timer(1).timeout

func _on_notice_area_body_entered(body: Node2D) -> void:
	following = true
	$notice_area.queue_free()
	$colisao1.modulate = Color.TRANSPARENT
	print(body)
func _physics_process(delta: float) -> void:
	if direction == "right":
		position += Vector2.RIGHT.rotated(rotation) * speed * delta
	if direction == "left":
		position += Vector2.LEFT.rotated(rotation) * speed * delta
	if following:
		var cu = (Global.current_pos - global_position)
		var target = transform.x.angle_to(cu)
		self.rotate(sign(target) * min(rotation_speed * delta, abs(target)))
	if showing_hitbox == false and Global.show_collisions:
		$colisao.show()
		$colisao1.show()
		showing_hitbox = true
	if showing_hitbox and Global.show_collisions == false:
		$colisao.hide()
		$colisao1.hide()
		showing_hitbox = false


func _on_body_entered(_body: Node2D) -> void:
	emit_signal("game_over")
