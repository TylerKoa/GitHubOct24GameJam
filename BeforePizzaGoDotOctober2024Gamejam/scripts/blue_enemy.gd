extends CharacterBody2D

@onready var game_manager: Node = %GameManager
@onready var hit_delay: Timer = $hitDelay

var speed = 70
var player_chase
var player = null

var health = 100
var player_inattack_zone = false

func check_health():
	game_manager.deadCheck()

func _physics_process(delta: float) -> void:
	
	check_health()
	
	#if game_manager.health <= 0:
		#get_tree().reload_current_scene()

	deal_with_damage()
	if player_chase:
		print("slime I think: " + str(position))
		print("player" + str(player.position))
		print("speed" + str(speed))
		position += (player.position - position)/speed
		
		$AnimatedSprite2D.play("walk")
		if(player.position.x - position.x) < 0:
			$AnimatedSprite2D.flip_h = true
		else:
			$AnimatedSprite2D.flip_h = false
	else:
		$AnimatedSprite2D.play("idel")

func _on_detection_area_body_entered(body: Node2D) -> void:
	player = body
	player_chase = true
	print("playerFound")


func _on_detection_area_body_exited(body: Node2D) -> void:
	player = body
	player_chase = false
	print("playerLeft")


func enemy():
	pass


func _on_enemy_hit_box_body_entered(body: Node2D) -> void:
	if body.has_method("is_a_player"):
		player_inattack_zone = true
		print("hit player")


func _on_enemy_hit_box_body_exited(body: Node2D) -> void:
	if body.has_method("is_a_player"):
		player_inattack_zone = false
		

func deal_with_damage():
	if player_inattack_zone:
		game_manager.remove_health()
		player_inattack_zone = false
		player_chase = false
		if((player.position.x - position.x) < 0):
			player.position[0] += -15
		else:
			player.position[0] += +15
		hit_delay.start()
		print("blue enemy " + str(health))


func _on_hit_delay_timeout() -> void:
	player_chase = true
