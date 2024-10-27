extends Node2D
@onready var skelly: Node2D = $"../../2ndBody"
@onready var label: Label = $Label
@onready var player: controller = $"../../Player"

var skull_type = "bare"
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var inside = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swap") and inside == true and player.possesingSkelly == false:
		var temp_position = skelly.position
		skelly.position = position
		position = temp_position
		skelly.play_bare()
		player.giveAnimeType(skull_type)


func _on_area_2d_body_entered(body: Node2D) -> void:
	if player.possesingSkelly == false:
		label.visible = true
	inside = true
	player.is_on_bones(true)

func _on_area_2d_body_exited(body: Node2D) -> void:
	if player.possesingSkelly == false:
		label.visible = false
	inside = false
	player.is_on_bones(false)
