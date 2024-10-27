
extends Control
@onready var exit_game: Button = $TextureRect/ExitGame
@onready var start_game: Button = $TextureRect/StartGame
@onready var start_level = load("res://scenes/game.tscn") as PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	$TextureRect/AnimatedSprite2D.play("default")
	await get_tree().create_timer(5.0).timeout
	get_tree().change_scene_to_packed(start_level)

# Called every frame. 'delta' is the elapsed time since the previous fram
