extends Area2D

#Timer for delay after death
@onready var timer: Timer = $Timer
@onready var animation_player: AnimationPlayer = $AnimationPlayer


func _on_body_entered(body: Node2D) -> void:
	print("You died")
	body.is_dead = true
	Engine.time_scale = 0.5
	
	#Rotate body depending on the direction character is facing
	if body.is_flipped == false:
		body.rotation_degrees = 80
	elif body.is_flipped == true:
		body.rotation_degrees = -80
	body.set_player_speed_zero()
	timer.start()
	


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
