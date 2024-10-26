extends CharacterBody2D
class_name controller

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

var currentHealth = 5


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
	if (distanceX[0] <= 50) and (distanceX[0] >= -50):
		game_manager.show_F_label()
	elif distanceX[0] > 50 || distanceX[0] < - 50:
		game_manager.hide_F_label()
	if (Input.is_action_just_pressed("swap")) and ((distanceX[0] <= 50) and (distanceX[0] >= -50)):
		print("swapping")
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

	

# Function called after death to stop player from moving
func set_player_speed_zero():
	speed = 0


func is_a_player():
	true
