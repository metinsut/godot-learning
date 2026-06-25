extends Node2D

@export var config: PlayerConfig

var start_position := Vector2.ZERO

func _ready() -> void:
	start_position = position

func _process(delta: float) -> void:
	if config == null:
		return

	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	position += direction * config.speed * delta

func _on_reset_button_pressed() -> void:
	position = start_position
