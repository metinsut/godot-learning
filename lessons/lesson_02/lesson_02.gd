extends Node2D

@onready var goal_area := $GoalArea
@onready var status_label := $UI/StatusLabel

func _ready() -> void:
	goal_area.player_entered.connect(_on_goal_area_player_entered)
	goal_area.player_exited.connect(_on_goal_area_player_exited)

func _on_goal_area_player_entered() -> void:
	status_label.text = "Goal alanının içindesin"

func _on_goal_area_player_exited() -> void:
	status_label.text = "Goal alanının dışındasın"
