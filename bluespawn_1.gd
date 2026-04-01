extends Marker2D

func _ready() -> void:
	spawn()
	
func spawn():
	var tween = get_tree().create_tween()
	await tween.tween_property($Sprite2D,"modulate", Color.WHITE, 3).finished
	$Sprite2D.modulate = "ff0000ac"
	spawn()
