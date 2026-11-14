extends Node2D


var player_height_level: int = 3
@onready var player = $player
@export var lawki1: Sprite2D
@export var lawki2: Sprite2D
@export var lawki3: Sprite2D
@export var biorko: Sprite2D
func _ready() -> void:
	$player/Camera2D.limit_left = 0
	$player/Camera2D.limit_up = 0
	$player/Camera2D.limit_right = 1600
	$player/Camera2D.limit_down = 975


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	lawki3.z_index = -1 if player.position.y > 340 else 1
	lawki2.z_index = -1 if player.position.y > 540 else 1
	lawki1.z_index = -1 if player.position.y > 740 else 1
	biorko.z_index = -1 if player.position.y > 340 else 1


func _on_bounce_timer_timeout() -> void:
	$UI/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()


		


func _on_door_body_entered(body: Node2D) -> void:
	if body == player:
		$interactables/Door.modulate = Color(0.0, 0.824, 0.663, 1.0)
		player.interact = "door"


func _on_door_body_exited(body: Node2D) -> void:
	if body == player:
		$interactables/Door.modulate = Color(1.0, 1.0, 1.0, 1.0)
		player.interact = ""
