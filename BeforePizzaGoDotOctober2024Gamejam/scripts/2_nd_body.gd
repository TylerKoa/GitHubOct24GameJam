extends Node2D

@onready var game_manager: Node = %GameManager
#Label
@onready var label: Label = $AnimatedSprite2D/Area2D/Label
@onready var showing_label = false
# Main character sprite
@onready var knight_animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
#Main character controller class call for movement
@export var follow_target: controller

#Character 2 sprite
@onready var skelly_sprite: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 60
var direction = 1

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_area_2d_mouse_entered() -> void:
	print("mouse inside")
	label.visible = true
	showing_label = true

func _on_area_2d_mouse_exited() -> void:
	#game_manager.show_F_label()
	#label.visible = false
	showing_label = false

func change_to_ghost():
	skelly_sprite.play("skellyIdel")
	

func change_to_knight():
	skelly_sprite.play("ghost_follow")
	
	#Add code to follow spirte

#Play Animations
func play_googles():
	skelly_sprite.play("priestSkelly")
func play_pop():
	skelly_sprite.play("popSkelly")
func play_hat():
	skelly_sprite.play("hatSkelly")
func play_idel():
	skelly_sprite.play("SkellyIdel")


func _on_cooldown_timeout() -> void:
	pass # Replace with function body.
