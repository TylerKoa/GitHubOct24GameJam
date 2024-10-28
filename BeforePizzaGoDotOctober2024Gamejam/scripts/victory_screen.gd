class_name VictoryScreen
extends Control
@onready var exit_game: Button = $TextureRect/ExitGame
@onready var start_game: Button = $TextureRect/StartGame
@onready var start_level = preload("res://scenes/main_menu.tscn") as PackedScene


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$TextureRect/AnimatedSprite2D.play("default")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass



func _on_start_game_button_down() -> void:
	get_tree().change_scene_to_packed(start_level)


func _on_exit_game_button_down() -> void:
	get_tree().quit()
