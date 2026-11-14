extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_bounce_timer_timeout() -> void:
	$UI/AnimationPlayer.play("fade_out")
	await get_tree().create_timer(1).timeout
	get_tree().reload_current_scene()
