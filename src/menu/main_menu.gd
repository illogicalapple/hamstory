extends Control

func to_screen(coordinates: Vector2i):
	var tween: Tween = create_tween()
	tween.tween_property($Camera2D, "position", Vector2(coordinates.x * 1920, coordinates.y * 1080), 1.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)



func _on_start_pressed():
	to_screen(Vector2(1, 1))
