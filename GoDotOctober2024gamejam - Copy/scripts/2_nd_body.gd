extends Node2D
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var right_ray_cast: RayCast2D = $RightRayCast
@onready var left_ray_cast: RayCast2D = $LeftRayCast
@onready var label: Label = $AnimatedSprite2D/Area2D/Label

const SPEED = 60
var direction = 1


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if right_ray_cast.is_colliding():
		animated_sprite.flip_h = true;
		


func _on_area_2d_mouse_entered() -> void:
	print("mouse inside")
	label.visible = true


func _on_area_2d_mouse_exited() -> void:
	label.visible = false
