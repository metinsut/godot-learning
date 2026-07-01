extends CharacterBody2D

@export var speed := 250.0

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	var collided := move_and_slide()

	if collided:
		var collision_count := get_slide_collision_count()
		print("Çarpışma sayısı: ", collision_count)
	
		for index in range(collision_count):
			var collision := get_slide_collision(index)
			var collider := collision.get_collider()
			var normal := collision.get_normal()

			print("Çarptığım node: ", collider.name)
			print("Çarpışma normal'i: ", normal)
			
			if normal == Vector2.RIGHT:
				print("Sol duvara temas ediyorum")
			elif normal == Vector2.LEFT:
				print("Sağ duvara temas ediyorum")
			elif normal == Vector2.DOWN:
				print("Üst duvara temas ediyorum")
			elif normal == Vector2.UP:
				print("Alt duvara temas ediyorum")
