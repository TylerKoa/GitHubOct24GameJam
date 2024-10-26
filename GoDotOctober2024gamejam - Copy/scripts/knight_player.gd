extends CharacterBody2D

@export var speed = 100
@export var is_flipped = false
@export var is_dead = false
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

#Function that is being called over and over while walking
func get_input():
	# Movement
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed
	
	# ---------------------- Directional animations ----------------------------------------------
	# Gets axis for movement
	var input_direction_axis = Input.get_axis("left", "right")
	#Play run and jump animations
	if input_direction_axis == 0:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	# If axis is > 0 then and not dead then switch animation
	if (input_direction_axis > 0) and (is_dead == false):
		is_flipped = false
		animated_sprite.flip_h = false
	# If axis is < 0 then and not dead then switch animation
	elif (input_direction_axis < 0) and (is_dead == false):
		is_flipped = true
		animated_sprite.flip_h = true;
	
# Function that is constantly being called to move character [don't touch]
func _physics_process(delta):
	get_input()
	move_and_slide()

# Function called after death to stop player from moving
func set_player_speed_zero():
	speed = 0
