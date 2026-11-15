extends Node2D


var level: int = 1
@onready var player = $player
@export var lawki1: Sprite2D
@export var lawki2: Sprite2D
@export var lawki3: Sprite2D
@export var biorko: Sprite2D
@export var popup: Node2D
@export var glanim: AnimationPlayer
@export var bounceTimer: Timer
@export var drzwi: Sprite2D
@export var plakat_1: Sprite2D
@export var plakat_2: Sprite2D
@export var plakat_3: Sprite2D
@export var pinpad: Sprite2D


var cdoor_open: bool = false


func _ready() -> void:
	$UI/HBoxContainer/InputCode.visible = false
	$UI/ItemView/Poster1.visible = false
	$UI/ItemView/Poster2.visible = false
	$UI/ItemView/Poster3.visible = false
	player.stop = true
	level = 1
	$player/Camera2D.limit_left = 0
	$player/Camera2D.limit_top = 0
	$player/Camera2D.limit_right = 1600
	$player/Camera2D.limit_bottom = 975
	_start()

func _start():
	glanim.play("fade_in")
	await get_tree().create_timer(1).timeout
	bounceTimer.start()
	player.stop = false
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if level ==1:
		lawki3.z_index = -1 if player.position.y > 340 else 1
		lawki2.z_index = -1 if player.position.y > 540 else 1
		lawki1.z_index = -1 if player.position.y > 740 else 1
		biorko.z_index = -1 if player.position.y > 340 else 1


func _on_bounce_timer_timeout() -> void:
	bounceTimer.stop()
	glanim.play("fade_out")
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()


		

func _on_door_body_entered(body: Node2D) -> void:
	if body == player:
		
		var sciezka = "res://Scenes/drzwipodswietlone.png"
		drzwi.texture = load(sciezka) 
		player.interact = "door"


func _on_door_body_exited(body: Node2D) -> void:
	if body == player:
		var normalne = "res://Scenes/drzwi.png"
		drzwi.texture = load(normalne)
	if body == player:
		$interactables/Door.modulate = Color(1.0, 1.0, 1.0, 1.0)
		if player.interact == "door": player.interact = ""

func pop_up(text: String, pos: Vector2):
	popup.position = pos
	popup.label.text = text
	popup.aniplay.play("popup")
	


func _on_code_door_body_entered(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/pinpadpodswietlone.png"
		pinpad.texture = load(sciezka)
		player.interact = "code_door"


func _on_code_door_body_exited(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/pinpad.webp"
		pinpad.texture = load(sciezka)
		if player.interact == "code_door":player.interact = ""


func _on_input_code_text_submitted(code: String) -> void:
	if code == "atk":
		pop_up("Dobry kod! Drzwi otwarte", Vector2(600,1800))
		cdoor_open = true
	else:
		pop_up("Zły kod", Vector2(player.position.x,player.position.y - 200))
	player.stop = false
	$UI/HBoxContainer/InputCode.visible = false
	$UI/HBoxContainer/InputCode.text = ""


func _on_poster_1_body_entered(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/plakat_1podswietlone.png"
		plakat_1.texture = load(sciezka)
		player.interact = "poster1"


func _on_poster_1_body_exited(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/plakat_1.png"
		plakat_1.texture = load(sciezka)
		if player.interact == "poster1":player.interact = ""
		
func _on_poster_2_body_entered(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/plakat_2podswietlone.png"
		plakat_2.texture = load(sciezka)
		player.interact = "poster2"


func _on_poster_2_body_exited(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/plakat_2.png"
		plakat_2.texture = load(sciezka)
		if player.interact == "poster2":player.interact = ""
		
func _on_poster_3_body_entered(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/plakat_3podswietlone.png"
		plakat_3.texture = load(sciezka)
		player.interact = "poster3"


func _on_poster_3_body_exited(body: Node2D) -> void:
	if body == player:
		var sciezka = "res://Graphics/plakat_3.png"
		plakat_3.texture = load(sciezka)
		if player.interact == "poster3":player.interact = ""


func _on_lampa_1_body_entered(body: Node2D) -> void:
	if body == player:
		
		player.interact = "lampa_1"


func _on_lampa_1_body_exited(body: Node2D) -> void:
	if body == player:
		
		if player.interact == "lampa_1":player.interact = ""

func _on_lampa_2_body_entered(body: Node2D) -> void:
	if body == player:
		
		player.interact = "lampa_2"


func _on_lampa_2_body_exited(body: Node2D) -> void:
	if body == player:
		
		if player.interact == "lampa_2":player.interact = ""
		
func _on_lampa_3_body_entered(body: Node2D) -> void:
	if body == player:
		
		player.interact = "lampa_3"


func _on_lampa_3_body_exited(body: Node2D) -> void:
	if body == player:
		
		if player.interact == "lampa_3":player.interact = ""

		
func _on_lampa_4_body_entered(body: Node2D) -> void:
	if body == player:
		
		player.interact = "lampa_4"


func _on_lampa_4_body_exited(body: Node2D) -> void:
	if body == player:
		
		if player.interact == "lampa_4":player.interact = ""
