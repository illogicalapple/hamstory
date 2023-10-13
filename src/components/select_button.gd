extends Button

var focus_state: bool = false:
	set(new_value):
		focus_state = new_value
		if focus_state:
			print("select")
			$Animate.play("select")
		else:
			$Animate.play_backwards("select")

func _ready():
	($Select as ColorRect).set_size(Vector2(get_size().x - 40, 0))
	$Select.set_anchors_preset(Control.PRESET_CENTER_BOTTOM)
	$Select.position -= Vector2($Select.get_size().x / 2, 30)


func _on_mouse_entered():
	focus_state = true
