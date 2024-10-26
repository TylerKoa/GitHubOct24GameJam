extends CanvasLayer

@onready var game_manager: Node = %GameManager
@onready var coin_counter: Label = $coinCounter
@onready var health_counter: Label = $HealthCounter


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_counter.text = "Coins: " + str(game_manager.score)
	health_counter.text = "Health: " + str(game_manager.health)

#Function made that is called by game_manger every time player gets coin
func update_coins_display():
	coin_counter.text = "Coins: " + str(game_manager.score)

func update_heart_display():
	health_counter.text = "Health: " + str(game_manager.health)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
