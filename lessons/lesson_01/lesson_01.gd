extends Node2D

@onready var player = $Player
@onready var player2 = $Player2
@onready var coin = $Coin
@onready var score_label = $ScoreLabel

var score := 0

func _ready() -> void:
	coin.collected.connect(_on_coin_collected)
	_update_score_label()

func _on_reset_button_pressed() -> void:
	player.reset_position()
	player2.reset_position()

func _on_coin_collected() -> void:
	score += 1
	_update_score_label()

func _update_score_label() -> void:
	score_label.text = "Score: " + str(score)
