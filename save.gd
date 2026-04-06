extends Area2D

@export var posicao: Vector2
@export var trigger: int

func _on_body_entered(_body: Node2D) -> void:
	Global.position = posicao
	if trigger == 1:
		for spawner in get_tree().get_nodes_in_group("area3"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
	if trigger == 2:
		for spawner in get_tree().get_nodes_in_group("area4"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area1"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 3:
		for spawner in get_tree().get_nodes_in_group("area5"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area2"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 4:
		for spawner in get_tree().get_nodes_in_group("area6"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area3"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 5:
		for spawner in get_tree().get_nodes_in_group("area7"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area4"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 6:
		for spawner in get_tree().get_nodes_in_group("area8"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area5"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 7:
		for spawner in get_tree().get_nodes_in_group("area9"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area6"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 8:
		for spawner in get_tree().get_nodes_in_group("area10"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area7"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 9:
		for spawner in get_tree().get_nodes_in_group("area11"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area8"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 10:
		for spawner in get_tree().get_nodes_in_group("area12"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area9"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	if trigger == 11:
		for spawner in get_tree().get_nodes_in_group("area13"):
			spawner.process_mode = Node.PROCESS_MODE_INHERIT
		for spawner in get_tree().get_nodes_in_group("area10"):
			spawner.process_mode = Node.PROCESS_MODE_DISABLED
	queue_free()
