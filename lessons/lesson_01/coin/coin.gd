extends Area2D

signal collected

func _ready() -> void:
	area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	if area.name != "PickupArea":
		return

	collected.emit()
	queue_free()
