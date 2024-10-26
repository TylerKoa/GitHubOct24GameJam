extends Node2D

#Label
@onready var label: Label = $AnimatedSprite2D/Area2D/Label
@onready var showing_label = false
# Main character sprite
@onready var knight_animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
#Main character controller class call for movement
@export var follow_target: controller

#Character 2 sprite
@onready var blob_animated_sprite: AnimatedSprite2D = $AnimatedSprite2D

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
	label.visible = false
	showing_label = false

func change_to_ghost():
	blob_animated_sprite.play("skellyIdel")
	

func change_to_knight():
	blob_animated_sprite.play("ghost_follow")
	
	#Add code to follow spirte
