extends CanvasLayer

@onready var game_manager: Node = %GameManager
@onready var coin_counter: Label = $coinCounter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_counter.text = "Coins: " + str(game_manager.score)

#Function made that is called by game_manger every time player gets coin
func update_coins_display():
	coin_counter.text = "Coins: " + str(game_manager.score)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
