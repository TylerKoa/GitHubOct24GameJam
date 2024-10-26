extends Area2D
@onready var game_manager: Node = %GameManager

func _on_body_entered(body: Node2D) -> void:
	print("You got hit")
	if body.is_flipped == false:
		body.position[0] -= 15
	elif body.is_flipped == true:
		body.position[0] += 15
	
	game_manager.remove_heal()
	body.currentHealth -= 1
	if body.currentHealth == 0:
		body.set_player_speed_zero()
		get_tree().reload_current_scene()
	print(body.currentHealth)
	
