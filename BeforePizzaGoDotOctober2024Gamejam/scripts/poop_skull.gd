extends Node2D
@onready var skelly: Node2D = $"../../2ndBody"
@onready var label: Label = $AnimatedSprite2D/Label
@onready var player: controller = $"../../Player"
@onready var player_sprite: AnimatedSprite2D = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var inside = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swap") and inside == true:
		var temp_position = skelly.position
		skelly.position = position
		position = temp_position
		skelly.play_pop()


func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Im inside")
	label.visible = true
	inside = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	inside = false
	label.visible = false
