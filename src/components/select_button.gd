extends Button

var height_or_whatever: float = 0:
	set(new_value):
		height_or_whatever = new_value
		$Select.set_size(Vector2($Select.get_size().x, height_or_whatever))

var focus_state: bool = false:
	set(new_value):
		focus_state = new_value
		if focus_state:
			var tween: Tween = create_tween()
			tween.tween_property(self, "height_or_whatever", 25, 0.1)
		else:
			var tween: Tween = create_tween()
			tween.tween_property(self, "height_or_whatever", 0, 0.1)

func _ready():
	($Select as ColorRect).set_size(Vector2(get_size().x - 40, 0))
	$Select.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	$Select.position -= Vector2($Select.get_size().x / 2, 30)

func _on_mouse_entered():
	focus_state = true

func _on_mouse_exited():
	focus_state = false
