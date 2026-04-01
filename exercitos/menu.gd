extends Control

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	$PanelContainer/Control/VBoxContainer2/fps_picker.selected = Global.index
	$PanelContainer/Control/VBoxContainer2/CheckButton.button_pressed = Global.show_collisions

func _on_fps_picker_item_selected(index: int) -> void:
	if index == 0:
		Global.fps = 5
	if index == 1:
		Global.fps = 10
	if index == 2:
		Global.fps = 15
	if index == 3:
		Global.fps = 30
	if index == 4:
		Global.fps = 60
	if index == 5:
		Global.fps = 120
	Global.index = index


func _on_resume_button_up() -> void:
	self.hide()
	var abomination: CharacterBody2D = get_parent().get_parent()
	abomination.modulate = Color.RED
	await get_tree().create_timer(0.5).timeout
	abomination.modulate = Color.YELLOW
	await get_tree().create_timer(0.5).timeout
	abomination.modulate = Color.GREEN
	await get_tree().create_timer(0.5).timeout
	abomination.modulate = Color.WHITE
	get_tree().paused = false
	queue_free()

func _on_check_button_toggled(toggled_on: bool) -> void:
	if toggled_on == true:
		Global.show_collisions = true
		
	else:
		Global.show_collisions = false
