extends CharacterBody2D

@onready var game = $".."
const SPEED = 200.0
const SPRINT = 2
var cursprint = 1.0
var stop = false
var view_item: bool = false
var direction: Vector2

var lampson: Vector4 = Vector4(0, 0, 0, 0)
var lampykklucz = [1, 3, 2, 4]
var lapmgracz= []

var interact: String = ""

func _physics_process(delta: float) -> void:
	var input_vector:= Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if Input.is_action_pressed("sprint"):
		cursprint = SPRINT
	else:
		cursprint = 1.0
	if Input.is_action_just_pressed("anyomove"):
		direction = input_vector
	if not stop:
		if input_vector.x == -1: $AnimatedSprite2D.play("walk_left")
		if input_vector.x == 1: $AnimatedSprite2D.play("walk_right")
		if input_vector.y == -1: $AnimatedSprite2D.play("walk_up")
		if input_vector.y == 1: $AnimatedSprite2D.play("walk_front")
	
	if not stop and input_vector == Vector2(0, 0): 
		$AnimationPlayer.play("RESET")
		if direction.x == -1: $AnimatedSprite2D.play("stand_left")
		if direction.x == 1: $AnimatedSprite2D.play("stand_right")
		if direction.y == -1: $AnimatedSprite2D.play("stand_up")
		if direction.y == 1: $AnimatedSprite2D.play("stand_front")
	
	else:
		cursprint = 1.0
	if stop == false:
		velocity = input_vector * SPEED * cursprint
		
		if not stop:
			move_and_slide()
			$AnimationPlayer.play("wave")

func _process(delta: float) -> void:
	if view_item and Input.is_action_just_pressed("ui_cancel"):
		match interact:
			"poster1":
				$"../UI/ItemView/Poster1".visible = false
				stop = false
			"poster2":
				$"../UI/ItemView/Poster2".visible = false
				stop = false
			"poster3":
				$"../UI/ItemView/Poster3".visible = false
				stop = false
		view_item = false
		
	if Input.is_action_just_pressed("interact"):
		if not view_item:
			match interact:
				"door":
					self.position = Vector2(50,1807.313)
					$"..".level +=1
					$Camera2D.limit_left = 0
					$Camera2D.limit_top = 1267.0
					$Camera2D.limit_right = 1600
					$Camera2D.limit_bottom = 2203.0
					interact = ""
				"code_door":
					if not game.cdoor_open:
						stop = true
						$"../UI/HBoxContainer/InputCode".visible = true
						$"../UI/HBoxContainer/InputCode".edit()
					else:
						self.position = Vector2(50,3000)
						$"..".level +=1
						$Camera2D.limit_left = 0
						$Camera2D.limit_top = 2460
						$Camera2D.limit_right = 1600
						$Camera2D.limit_bottom = 3450
						$Camera2D.zoom = Vector2(0.9, 0.9)
				"poster1":
					stop = true
					view_item = true
					$"../UI/ItemView/Poster1".visible = true
				"poster2":
					stop = true
					view_item = true
					$"../UI/ItemView/Poster2".visible = true
				"poster3":
					stop = true
					view_item = true
					$"../UI/ItemView/Poster3".visible = true
				"lampa_1":
					if lampson.x == 0:
						$"../lvl3/Lampa1/lighti1".visible = true
						lapmgracz.append(1)
						lampson.x = 1
				"lampa_2":
					if lampson.y == 0:
						$"../lvl3/Lampa2/loght2".visible= true
						lapmgracz.append(2)
						lampson.y = 1
				"lampa_3":
					if lampson.z == 0:
						$"../lvl3/Lampa3/light3".visible=true
						lapmgracz.append(3)
						lampson.z = 1
				"lampa_4":
					if lampson.w == 0:
						$"../lvl3/Lampa4/light4".visible=true
						lapmgracz.append(4)
						lampson.w = 1
			if len(lapmgracz) == 4:
				if lampykklucz==lapmgracz:
					game.glanim.play("swiatlo")
					game.end = true
				else:
					lapmgracz = []
					lampson = Vector4(0, 0, 0 ,0)
					$"../lvl3/Lampa1/lighti1".visible = false
					$"../lvl3/Lampa2/loght2".visible= false
					$"../lvl3/Lampa3/light3".visible=false
					$"../lvl3/Lampa4/light4".visible=false
					
					
				
				
