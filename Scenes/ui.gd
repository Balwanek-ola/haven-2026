extends CanvasLayer

@onready var timelabel = %TimerLabel
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timelabel.text = "%0.2f" % $BounceTimer.wait_time


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timelabel.text = "%0.2f" % $BounceTimer.time_left
