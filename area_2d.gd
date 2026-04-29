extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_body_entered(body):
	# Проверяем, что вошел именно игрок
	if body.name == "Player":
		# 1. Запускаем звук
		if has_node("AudioStreamPlayer2D"):
			$AudioStreamPlayer2D.play()

		# 2. Запускаем все взрывы внутри зоны
		for child in get_children():
			if child.has_method("burst"):
				child.burst()
		
		# 3. Эффект смерти: пауза и перезагрузка
		await get_tree().create_timer(0.2).timeout
		get_tree().reload_current_scene()
