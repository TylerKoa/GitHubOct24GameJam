
extends Area2D

@onready var game_manager: Node = %GameManager
#Timer for delay after death
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var not_dead_timer: Timer = $notDeadTimer


func _on_body_entered(body: Node2D) -> void:
	print("-5 health")
	print("body ealth:" + str(body.currentHealth))
	if body.has_method("is_a_player"):
		if body.currentHealth <= 0:
			Engine.time_scale = 0.5
	
	#Rotate body depending on the direction character is facing
	"""
	if (body.is_flipped == false) and (body.currentHealth <= 5):
		body.rotation_degrees = 80
	elif (body.is_flipped == true)  and (body.currentHealth <= 5):
		body.rotation_degrees = -80
	if (body.is_flipped == false) and (body.currentHealth > 5):
		body.position[0] -= 25
	elif (body.is_flipped == true) and (body.currentHealth > 5):
		body.position[0] += 25
	"""
	body.removeFive()
	print(body.currentHealth)


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
