extends Control

var transition_list: Array[Vector2i] = [Vector2i(0, 0)] # this array stores the coordinates so you can chain esc
var active_tweens: Array[Tween] = [] # this array stores the tweens to kill later
var esc_exception: Callable
var is_esc_exception: bool = false

func to_screen(coordinates: Vector2i, push: bool = true) -> Vector2i:
	# some logging stuff:
	for tween in active_tweens: tween.kill() # kill all current tweens
	if push: transition_list.append(coordinates) # push to coordinates
	
	# audio:
	$MovementSFX.play()
	
	# movement stuff:
	var tween: Tween = create_tween()
	active_tweens.append(tween) # log tween so it can be killed later
	tween.tween_property($Camera2D, "position", Vector2(coordinates.x * 1920, coordinates.y * 1080), 1.0).set_trans(Tween.TRANS_CUBIC).set_ease(Tween.EASE_IN_OUT)
	
	# print(transition_list) # ROP
	
	return coordinates

func _on_start_pressed() -> Vector2i:
	return (to_screen(Vector2i(1, 1)) as Vector2i)

func _input(event: InputEvent) -> void:
	# THIS IS THE ESCAPE BUTTON CODE
	# change to functional code if we need another input
	
	# anti-conditions
	if not event.is_action_pressed("ui_back"): return
	
	# check for escape override
	if is_esc_exception:
		esc_exception.call()
		return
	
	if len(transition_list) < 2: return
	
	transition_list.pop_back()
	to_screen(transition_list.back(), false)


func _on_quit_pressed():
	$MainScreen/QuitConfirm.show()
	is_esc_exception = true
	esc_exception = Callable($MainScreen/QuitConfirm, "hide")

func _on_cancel_pressed():
	is_esc_exception = false
	$MainScreen/QuitConfirm.hide()


func quit_game_frfr():
	get_tree().quit()
