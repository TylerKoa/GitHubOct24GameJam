extends CharacterBody2D
class_name controller

@export var speed = 100
@export var is_flipped = false
@export var is_dead = false
@onready var player_animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var bone_pile: Node2D = $"../BonePile"
@onready var animation_player: AnimationPlayer = $PickUpSound/AnimationPlayer


#var currentHealth = 5

var enemy_inattack_range = false
var ememy_attack_cooldown = true
var health = 100
var player_alive = true
var attack_ip = false

#@export var possesingSkelly = false
#@export var mouse_currently_inside = false

#@onready var Second_body: Node2D = $"../2ndBody"
#@onready var player: CharacterBody2D = $"."
#var keep_following = false
#Function that is being called over and over while walking
func get_input():
	# Movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	
	#Facing Directions
	var input_direction_axis = Input.get_axis("left", "right")
	if (input_direction_axis > 0) and (is_dead == false):
		is_flipped = false
		player_animated_sprite.flip_h = false
	# If axis is < 0 then and not dead then switch animation
	elif (input_direction_axis < 0) and (is_dead == false):
		is_flipped = true
		player_animated_sprite.flip_h = true;
#	if bone_pile.playerTouchingSkeleton == 0:
#		player_animated_sprite.play("ghostIdel")
#	elif bone_pile.playerTouchingSkeleton == 1:
#		player_animated_sprite.play("transformIntoSkelly")
#	else:
#			player_animated_sprite.play("skellyRun")


	
	
	# Check if showing label and f
	#var mouse_position = get_global_mouse_position()
	
	"""
	# -------------------- If mouse over 2nd character and F is clicked -------------------
	var distanceX = (knight_player.position-Second_body.position)
	
	if (Input.is_action_just_pressed("swap")) and (Second_body.showing_label == true) and (distanceX[0] < 30 and distanceX[0] > -30):
		
		#Swap character positons
		var temp_current_location = knight_player.position
		knight_player.position = Second_body.position
		
		Second_body.position[0] = temp_current_location[0]
		Second_body.position[1] = temp_current_location[1]
		
		
		if possesingSkelly == false:
			possesingSkelly = true
			Second_body.change_to_knight()
		else:
			possesingSkelly = false
			Second_body.change_to_ghost()
	
	# ---------------------- Directional animations ----------------------------------------------
	# Gets axis for movement
	
	if (input_direction_axis == 0) and (possesingSkelly == false):
		animated_sprite.play("ghostIdle")
	elif(input_direction_axis != 0) and (possesingSkelly == false):
		animated_sprite.play("ghostRun")
	elif(input_direction_axis == 0) and (possesingSkelly == true):
		animated_sprite.play("possSkellyLong")
	else:
		animated_sprite.play("skellyRun")
		
	# If axis is > 0 then and not dead then switch animation
	if (input_direction_axis > 0) and (is_dead == false):
		is_flipped = false
		animated_sprite.flip_h = false
	# If axis is < 0 then and not dead then switch animation
	elif (input_direction_axis < 0) and (is_dead == false):
		is_flipped = true
		animated_sprite.flip_h = true;
	

func startGhostFollow():
	while(keep_following):
		Second_body.position[0] = knight_player.position[0] - 3
		Second_body.position[1] = knight_player.position[1] - 3
		"""
	
# Function that is constantly being called to move character [don't touch]
func _physics_process(delta):
	get_input()
	move_and_slide()
	attack()
	
	enemy_attack()
	if  health <= 0:
		player_alive = false
		health = 0
		print("Player died")
		self.queue_free()

# Function called after death to stop player from moving
func set_player_speed_zero():
	speed = 0


func player():
	pass

func _on_player_hit_box_body_entered(body: Node2D) -> void:
	if body.has_method("enemy"):
		enemy_inattack_range = true


func _on_player_hit_box_body_shape_exited(body_rid: RID, body: Node2D, body_shape_index: int, local_shape_index: int) -> void:	
	if body.has_method("enemy"):
		enemy_inattack_range = false


func enemy_attack():
	if enemy_inattack_range and ememy_attack_cooldown == true:
		health -= 20
		ememy_attack_cooldown = false
		$attack_cooldown.start()
		print(health)
		print("Player took damage")


func _on_timer_timeout() -> void:
	ememy_attack_cooldown = true

func attack():
	if Input.is_action_just_pressed("attack"):
		$attack_cooldown.start()
		GameManager.player_current_attack = true
		attack_ip = false


func _on_deal_attack_timer_timeout() -> void:
	$deal_attack_timer.stop()
	GameManager.player_current_attack = false
	attack_ip = false
