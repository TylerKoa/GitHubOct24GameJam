extends CharacterBody2D
@onready var game_manager: Node = %GameManager

func _process(delta: float) -> void:
	game_manager.object_move_to_player(self)
