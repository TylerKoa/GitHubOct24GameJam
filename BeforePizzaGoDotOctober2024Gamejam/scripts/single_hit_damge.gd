extends Area2D
@onready var game_manager: Node = %GameManager
@onready var Death_level = preload("res://scenes/Death_Screen.tscn") as PackedScene

func _on_body_entered(body: Node2D) -> void:
	print("You got hit")
	if body.is_flipped == false:
		body.position[0] -= 15
	elif body.is_flipped == true:
		body.position[0] += 15
	
	game_manager.remove_health()
	if body.currentHealth == 0:
		if body.possesingSkelly == true:
			body.swap()
		else:
			get_tree().change_scene_to_packed(Death_level)
			body.set_player_speed_zero()
	print(body.currentHealth)
	
