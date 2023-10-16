extends CharacterBody2D


@export var speed := 400.0


func _physics_process(_delta: float) -> void:
	var input := Input.get_vector("move_left", "move_right", "move_up", "move_down").normalized()
	velocity = input * speed
	move_and_slide()
