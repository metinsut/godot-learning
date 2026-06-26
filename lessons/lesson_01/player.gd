extends Node2D

@export var config: PlayerConfig

@onready var body: Sprite2D = $Body
@onready var name_label: Label = $NameLabel
var start_position := Vector2.ZERO

func _ready() -> void:
	start_position = position
	_apply_config()
	
func _apply_config() -> void:
	if config == null:
		return

	body.modulate = config.body_color
	name_label.text = config.display_name

func _process(delta: float) -> void:
	if config == null:
		return

	var direction := _get_input_direction()
	_move(direction, delta)

func _move(direction: Vector2, delta: float) -> void:
	position += direction * config.speed * delta

func _get_input_direction() -> Vector2:
	return Input.get_vector(
		config.left_action,
		config.right_action,
		config.up_action,
		config.down_action,
	)

func _on_reset_button_pressed() -> void:
	reset_position()

func reset_position() -> void:
	position = start_position
