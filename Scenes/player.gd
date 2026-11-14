extends CharacterBody2D

@onready var game = $".."
const SPEED = 200.0
const SPRINT = 1.5
var cursprint = 1.0
var stop = false

var interact: String = ""

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
		
		if not stop:
			move_and_slide()

func _process(delta: float) -> void:
	if Input.is_action_pressed("interact"):
		match interact:
			"door":
				self.position = Vector2(50,1807.313)
				$"..".level +=1
				$Camera2D.limit_left = 0
				$Camera2D.limit_top = 1267.0
				$Camera2D.limit_right = 1600
				$Camera2D.limit_bottom = 2203.0
				interact = ""
			"":
				game.pop_up("fart", game.player.position)
				
