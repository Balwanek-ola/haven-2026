extends CharacterBody2D

const SPEED = 200.0
const SPRINT = 1.5
var cursprint = 1.0
var stop = false

func _physics_process(delta: float) -> void:
	var input_vector:= Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_action_pressed("sprint"):
		cursprint = SPRINT
	else:
		cursprint = 1.0
	if stop == false:
		velocity = input_vector * SPEED * cursprint
		if input_vector != null:
			if input_vector.x > 0:
				$Icon.flip_h = true
			elif input_vector.x < 0:
				$Icon.flip_h = false
			move_and_slide()
