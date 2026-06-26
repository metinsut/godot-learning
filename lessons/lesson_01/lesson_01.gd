extends Node2D

@onready var player = $Player
@onready var player2 = $Player2

func _on_reset_button_pressed() -> void:
	player.reset_position()
	player2.reset_position()
