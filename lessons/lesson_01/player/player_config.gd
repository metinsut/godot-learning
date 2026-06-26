extends Resource
class_name PlayerConfig

@export var speed := 250.0
@export var start_position := Vector2(320, 180)
@export var body_color := Color.WHITE

@export var left_action: StringName = &"ui_left"
@export var right_action: StringName = &"ui_right"
@export var up_action: StringName = &"ui_up"
@export var down_action: StringName = &"ui_down"
@export var display_name := "Player"
