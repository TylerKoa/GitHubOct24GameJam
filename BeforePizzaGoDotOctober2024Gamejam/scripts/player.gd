extends CharacterBody2D
class_name controller


@onready var bullet_scene = preload("res://bullet.tscn")
@onready var main = get_tree().get_root().get_node("Game")
@onready var projectile = load("res://projectile.tscn")
@onready var game_manager: Node = %GameManager
@export var speed = 100
@export var is_flipped = false
@export var is_dead = false
@onready var player_animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var bone_pile: Node2D = $"../BonePile"
@onready var animation_player: AnimationPlayer = $PickUpSound/AnimationPlayer
@onready var knight_player: controller = $"."
@onready var label: Label = $AnimatedSprite2D/Area2D/Label
@onready var skelly_area_2d: Area2D = $AnimatedSprite2D/Area2D
@onready var cooldown_timer = $Timer

var currentHealth = 5
var can_shoot = true


func removeFive():
	currentHealth -= 5
	game_manager.remove_five_health()
@export var possesingSkelly = false
@export var mouse_currently_inside = false

@onready var Second_body: Node2D = $"../2ndBody"
@onready var player: CharacterBody2D = $"."
var keep_following = false

#Function that is being called over and over while walking
func get_input():
	if Input.is_action_just_pressed("letMeOut"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
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
	
	# Check if showing label and f
	var mouse_position = get_global_mouse_position()
	# -------------------- If mouse over 2nd character and F is clicked -------------------
	var distanceX = (knight_player.position-Second_body.position)
	if (distanceX[0] <= 50) and (distanceX[0] >= -50) and (possesingSkelly == false):
		game_manager.show_F_label()
		game_manager.hide_smallF_label()
	elif(distanceX[0] <= 50) and (distanceX[0] >= -50) and (possesingSkelly == true):
		game_manager.hide_F_label()
		game_manager.show_smallF_label()
	elif((distanceX[0] <= 50) and (distanceX[0] >= -50) and (possesingSkelly == true)):
		game_manager.hide_F_label()
		game_manager.show_smallF_label()
	elif(((distanceX[0] >= 50) || (distanceX[0] <= -50)) and (possesingSkelly == false)):
		game_manager.hide_F_label()
		game_manager.hide_smallF_label()
	if (Input.is_action_just_pressed("swap")) and ((distanceX[0] <= 50) and (distanceX[0] >= -50)) and ((distanceX[1] <= 50) and (distanceX[1] >= -50)):
		print("swapping")
		#Swap character positons
		var temp_current_location = knight_player.position
		knight_player.position = Second_body.position
		Second_body.position[0] = temp_current_location[0]
		Second_body.position[1] = temp_current_location[1]
		
		
		if possesingSkelly == false:
			
			possesingSkelly = true
			speed = 100
			player_animated_sprite.play("skellyRun")
			Second_body.change_to_knight()
			#get_tree().get_root().get_node("2ndBody").visible = false
			
		else:
			$AnimatedSprite2D.visible = true
			knight_player.position = Second_body.position
			possesingSkelly = false
			speed = 150
			player_animated_sprite.play("ghostRun")
			Second_body.change_to_ghost()
			
	while (possesingSkelly == true):
		await get_tree().create_timer(0.2).timeout
		Second_body.position = knight_player.position 
	
	# ---------------------- Directional animations ----------------------------------------------
	# Gets axis for movement
		
	# If axis is > 0 then and not dead then switch animation
	if (input_direction_axis > 0) and (is_dead == false):
		is_flipped = false
	# If axis is < 0 then and not dead then switch animation
	elif (input_direction_axis < 0) and (is_dead == false):
		is_flipped = true


func startGhostFollow():
	while(keep_following):
		Second_body.position[0] = knight_player.position[0] - 3
		Second_body.position[1] = knight_player.position[1] - 3
	
# Function that is constantly being called to move character [don't touch]
func _physics_process(delta):
	get_input()
	move_and_slide()
	if possesingSkelly == true and Input.is_action_just_pressed("attack"):
		shoot()


# Function called after death to stop player from moving
func set_player_speed_zero():
	speed = 0


func is_a_player():
	true
	
func shoot():
	if (Input.is_action_just_pressed("attack") and can_shoot == true):
		var bullet = bullet_scene.instantiate()
		bullet.position.x = position.x
		bullet.position.y = position.y
		bullet.bullet_direction = (position - get_global_mouse_position()).normalized()
		get_parent().add_child(bullet)
		can_shoot = false
		$Cooldown.start()
		print("action pressed")
	else:
		print("Weapon is on cooldown!")




func _on_cooldown_timeout() -> void:
	can_shoot = true
	print("can shoot")
