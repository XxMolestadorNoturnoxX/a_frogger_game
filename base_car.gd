extends Area2D

@export var color: String
@export var speed = 269
var black = preload("res://frogger/graphics/cars/black.png")
var white = preload("res://frogger/graphics/cars/white.png")
var direction = "left"
var showing: bool = false
var showing_hitbox: bool = false
signal game_over
#cu, cuzinho, cuzao
func _ready() -> void:
	if color == "green":
		speed = 369
	if color == "yellow":
		speed = 469
	if color == "pink":
		speed = 469
	if color == "blue":
		direction = "down"
	if color == "blackwhite":
		speed = 333
	if position.x <= 0:
		direction = "right"
	if direction == "left":
		self.scale.x = -1
	await get_tree().create_timer(1).timeout

func _physics_process(delta: float) -> void:
	if color == "purple":
		speed = Global.velocidade
	if color == "blackwhite" and Global.player_sprinting == true:
		speed = 999
		$Sprite2D.texture = white
	if color == "blackwhite" and Global.player_sprinting == false:
		speed = 333
		$Sprite2D.texture = black
		
	if direction == "right" and color != "bug":
		position += Vector2.RIGHT * speed * delta
	if direction == "left" and color != "bug":
		position += Vector2.LEFT * speed * delta
	if direction == "down":
		position += Vector2.DOWN * speed * delta
		
func _process(_delta: float) -> void:
	if color == "bug":
		if direction == "right":
			position += Vector2.RIGHT * speed
		if direction == "left":
			position += Vector2.LEFT * speed
	if showing_hitbox == false and Global.show_collisions:
		$colisao.show()
		showing_hitbox = true
	if showing_hitbox and Global.show_collisions == false:
		$colisao.hide()
		showing_hitbox = false
func _on_body_entered(_body: Node2D) -> void:
	emit_signal("game_over")
