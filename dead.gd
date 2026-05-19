extends Control


func _on_button_button_up() -> void:
	SaveManager.save_game({"positionx": Global.position.x, "positiony": Global.position.y, "areas": Global.areas, "gun": Global.gun, "health": Global.health, "has_russo": Global.russo})
	get_tree().quit()
