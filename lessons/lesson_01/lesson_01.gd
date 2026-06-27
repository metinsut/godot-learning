extends Node2D
const COIN_SCENE := preload("res://lessons/lesson_01/coin/coin.tscn")

@onready var player = $Player
@onready var player2 = $Player2
@onready var coin = $Coin
@onready var score_label = $ScoreLabel

var score := 0
var coin_start_position := Vector2.ZERO
var coin_start_scale := Vector2.ONE

func _ready() -> void:
	coin_start_position = coin.position
	coin_start_scale = coin.scale
	coin.collected.connect(_on_coin_collected)
	_update_score_label()

func _on_reset_button_pressed() -> void:
	player.reset_position()
	player2.reset_position()
	score = 0
	_update_score_label()
	
	if not is_instance_valid(coin):
		_spawn_coin()

func _on_coin_collected() -> void:
	score += 1
	_update_score_label()

func _update_score_label() -> void:
	score_label.text = "Score: " + str(score)
	
func _spawn_coin() -> void:
	var new_coin = COIN_SCENE.instantiate()
	new_coin.position = coin_start_position
	new_coin.scale = coin_start_scale
	new_coin.collected.connect(_on_coin_collected)
	add_child(new_coin)
	coin = new_coin
