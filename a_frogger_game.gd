extends Node2D

var red_car = preload("res://red_car.tscn")
var green_car = preload("res://green_car.tscn")
var yellow_car = preload("res://yellow_car.tscn")
var purple_car = preload("res://purple_car.tscn")
var pink_car = preload("res://pink_car.tscn")
var blue_car = preload("res://blue_car.tscn")
var brown_car = preload("res://brown_car.tscn")
var onibus = preload("res://onibus.tscn")
var glitched_car = preload("res://glitched.tscn")
var orange_car = preload("res://orange_car.tscn")
var blackwhite = preload("res://blackwhite.tscn")
var tiro = preload("res://bala.tscn")
var thiago = preload("res://thiago.tscn")
var is_white: bool = false
var is_black: bool = true
var game = preload("res://gameover.tscn")
var menu = preload("res://exercitos/menu.tscn")
var game_over = preload("res://exercitos/dead.tscn")
var dead = false
var on_menu = false

func _ready() -> void:
	for spawn in get_tree().get_nodes_in_group("area1"):
		spawn.process_mode = Node.PROCESS_MODE_INHERIT
	for spawn in get_tree().get_nodes_in_group("area2"):
		spawn.process_mode = Node.PROCESS_MODE_INHERIT
	for blue in $spawns/blue.get_children():
		blue.blue_spawn.connect(blue_spawn)
	for brown in $spawns/brown.get_children():
		brown.brown_spawn.connect(brown_spawn)
	for bug in $spawns/glitched.get_children():
		bug.glitched_spawn.connect(bug_spawn)
	for red in $spawns/red.get_children():
		red.red_spawn.connect(red_spawn)
	for green in $spawns/green.get_children():
		green.green_spawn.connect(green_spawn)
	for yellow in $spawns/yellow.get_children():
		yellow.yellow_spawn.connect(yellow_spawn)
	for bus in $spawns/bus.get_children():
		bus.bus_spawn.connect(bus_spawn)
	for orange in $spawns/orange.get_children():
		orange.orange_spawn.connect(orange_spawn)
	for blwh in $spawns/blackwhite.get_children():
		blwh.blwh_spawn.connect(blackwhite_spawn)
	for purple in $spawns/purple.get_children():
		purple.purple_spawn.connect(purple_spawn)
	for pink in $spawns/pink.get_children():
		pink.pink_spawn.connect(pink_spawn)

func _process(_delta: float) -> void:
	for car in get_tree().get_nodes_in_group("cars"):
		if car.game_over.is_connected(gameover) == false:
			car.game_over.connect(gameover)
	if Input.is_action_just_pressed("Menu") and on_menu == false and dead == false:
		get_tree().paused = true
		var manu = menu.instantiate()
		$ABOMINATION/test.add_child(manu)
	if Global.health <= 0:
		get_tree().paused = true
		var its_over = game_over.instantiate()
		$ABOMINATION/test.add_child(its_over)
#aSS (CU)
	
func gameover():
	if dead == false and on_menu == false:
		dead = true
		$ABOMINATION.hide()
		$ABOMINATION.stop = 0
		var over = game.instantiate()
		$ABOMINATION/test.add_child(over)
		over.restart.connect(restart)

func restart():
	$ABOMINATION.show()
	$ABOMINATION.stop = 1
	$ABOMINATION.position = Global.position
	dead = false
	for ocar in $orange_cars.get_children():
		if ocar.following == true:
			ocar.queue_free()

func red_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var rcar = red_car.instantiate()
	rcar.position = marker_pos
	rcar.direction = direction
	$cars.add_child(rcar)
	rcar.z_index = 1 + index


func green_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var grcar = green_car.instantiate()
	grcar.position = marker_pos
	grcar.direction = direction
	$cars.add_child(grcar)
	grcar.z_index = 1 + index


func yellow_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var ycar = yellow_car.instantiate()
	ycar.position = marker_pos
	ycar.direction = direction
	$cars.add_child(ycar)
	ycar.z_index = 1 + index


func purple_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var pucar = purple_car.instantiate()
	pucar.position = marker_pos
	pucar.direction = direction
	$cars.add_child(pucar)
	pucar.z_index = 1 + index

#vc saiu do apartamento e eu meio que queria uma prank pra fazer e eu nunca sei oq fazer, CUUCUCUCUCUCUCUCUCUCUUCCCUC
#então ao invés de baixar imagens sugestivas de furries gays numa pasta secreta pra você CUCCUCUCUUUCUUCCCCUC
#achar no seu pc depois, eu decidi vandalizar seu código do mesmo jeito que eu fiz da outra CCCICUCOIUCOIUOCIUOICUUCIUCCIOCUIOCUICCadoraodoaroadoroaord
#fez, pela referência. CUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUUU

func pink_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var picar = pink_car.instantiate()
	picar.position = marker_pos
	picar.direction = direction
	$cars.add_child(picar)
	picar.z_index = 1 + index


func blue_spawn(marker, index):
	var marker_pos = marker.position
	var blcar = blue_car.instantiate()
	blcar.position = marker_pos
	$cars.add_child(blcar)
	blcar.z_index = 3 + index


func bus_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var bus = onibus.instantiate()
	bus.position = marker_pos
	bus.direction = direction
	$cars.add_child(bus)
	bus.z_index = 1 + index


func brown_spawn(marker, index, direction):
	var marker_pos = marker.position
	var brcar = brown_car.instantiate()
	brcar.position = marker_pos
	brcar.direction = direction
	$cars.add_child(brcar)
	brcar.z_index = 2 + index

func bug_spawn(marker, speed, index, direction) -> void:
	var marker_pos = marker.position
	var glcar = glitched_car.instantiate()
	glcar.position = marker_pos
	glcar.direction = direction
	glcar.speed = speed
	$cars.add_child(glcar)
	glcar.z_index = 1 + index
#CU
#kkkkk on mirella entered

func orange_spawn(marker, speed, index, direction) -> void:
	var marker_pos = marker.position
	var ocar = orange_car.instantiate()
	ocar.position = marker_pos
	ocar.direction = direction
	ocar.speed = speed
	$orange_cars.add_child(ocar)
	ocar.z_index = 4 + index
	
func blackwhite_spawn(marker, index, direction) -> void:
	var marker_pos = marker.position
	var blwh = blackwhite.instantiate()
	blwh.position = marker_pos
	blwh.direction = direction
	$cars.add_child(blwh)
	blwh.z_index = 1 + index


func _on_abomination_andar() -> void:
	if is_white:
		for marker in $spawns/blackwhite.get_children():
			marker.white = false
		is_white = false
		is_black = true


func _on_abomination_correr() -> void:
	if is_black:
		for marker in $spawns/blackwhite.get_children():
			marker.white = true
		is_black = false
		is_white = true


func _on_abomination_shoot(bullet_pos: Variant, bullet_dir: Variant, bullet_rot: Variant) -> void:
	var bala = tiro.instantiate()
	bala.global_position = bullet_pos
	$projectiles.add_child(bala)
	bala.direction = bullet_dir
	bala.rotation = bullet_rot
	bala.z_index = 69


func _on_save_31_body_entered(_body: Node2D) -> void:
	$ABOMINATION.russo()
	$saves/save31.queue_free()

func chase():
	$ABOMINATION.chase()
	$Russo.ackorda()
	var thsa: StaticBody2D = thiago.instantiate()
	thsa.global_position = Vector2(914,-149734.0)
	thsa.rotation_degrees = 90
	thsa.scale = Vector2(0.4,1.2)
	$thaigos.add_child(thsa)
