extends Node

const save_file_name: String = "user://save.json"
const default_dictionary: Dictionary = {"positionx": 830.0, "positiony": 1156.0, "areas": ["area1", "area2"], "gun": false, "health": 100, "has_russo": false}

## Stores data to a save file to be loaded from later
func save_game(data: Dictionary) -> void:
	var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.WRITE)
	if save_file == null:
		push_error("Failed to open file.")
		return
	var json_string: String = JSON.stringify(data) # Converts dictionary to one long string "{...}"
	save_file.store_line(json_string)
	save_file.close()
	print("saved sucesfully")
	get_tree().quit()
	

## Loads data from a save file
func load_game() -> Dictionary:
	if FileAccess.file_exists(save_file_name): # i.e. The game has been saved before
		var save_file = FileAccess.open(save_file_name, FileAccess.READ)
		var json = JSON.new()
		var json_string = save_file.get_line()
		if json.parse(json_string) == OK:
			var data = json.get_data()
			save_file.close()
			return data # Successful retrieval
		else:
			push_error("Corrupted data: " + json.get_error_message())
	return default_dictionary

func reset_save() -> void:
	save_game(default_dictionary)
	get_tree().quit()
