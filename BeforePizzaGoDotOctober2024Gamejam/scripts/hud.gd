extends CanvasLayer

@onready var game_manager: Node = %GameManager
@onready var coin_counter: Label = $coinCounter
@onready var health_counter: Label = $HealthCounter
@onready var subtract_one_health: Label = $SubtractOneHealth
@onready var show_subtraction_timer: Timer = $showSubtraction
@onready var subtract_five_health: Label = $SubtractFiveHealth
@onready var add_one_health: Label = $AddOneHealth
@onready var show_addition_timer: Timer = $showAddition
@onready var add_one_coin: Label = $AddOneCoin
@onready var show_coin_addition: Timer = $showCoinAddition
@onready var dead_timer: Timer = $deadTimer
@onready var player: controller = $"../../Player"
@onready var Death_level = preload("res://scenes/Death_Screen.tscn") as PackedScene
@onready var subtract_one_health_2: Label = $SubtractOneHealth2
@onready var show_damage: Timer = $showDamage


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	coin_counter.text = "Spirits: " + str(game_manager.score)
	health_counter.text = "Health: " + str(game_manager.health)

#Function made that is called by game_manger every time player gets coin
func update_coins_display():
	coin_counter.text = "Spirits: " + str(game_manager.score)

#Updating hearts in corner
func update_heart_display():
	health_counter.text = "Health: " + str(game_manager.health)

#Update showing subtracting hearts by character
func subtract_heart_display():
	if (subtract_one_health.text == "- 1") and (subtract_one_health.visible == true):
		subtract_one_health.text = "- 2"
	elif subtract_one_health.text == "- 2" and (subtract_one_health.visible == true):
		subtract_one_health.text = "- 3"
	elif subtract_one_health.text == "- 3" and (subtract_one_health.visible == true):
		subtract_one_health.text = "- 4"
	elif subtract_one_health.visible != true:
		subtract_one_health.text = "- 1"
		subtract_one_health.visible = true
		#ssubtract_one_health.visible = true
	show_subtraction_timer.start()

func hudSubtract_enemy_one():
	if (subtract_one_health_2.text == "- 1") and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 2"
	elif subtract_one_health_2.text == "- 2" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 3"
	elif subtract_one_health_2.text == "- 3" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 4"
	elif subtract_one_health_2.text == "- 4" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 5"
	elif subtract_one_health_2.text == "- 5" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 6"
	elif subtract_one_health_2.text == "- 6" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 7"
	elif subtract_one_health_2.text == "- 7" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 8"
	elif subtract_one_health_2.text == "- 8" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 9"
	elif subtract_one_health_2.text == "- 0" and (subtract_one_health_2.visible == true):
		subtract_one_health_2.text = "- 10"
	elif subtract_one_health_2.visible != true:
		subtract_one_health_2.text = "- 1"
		subtract_one_health_2.visible = true
	show_damage.start()


func checkIfDead():
	if game_manager.health <= 0:
		if player.possesingSkelly == true:
			game_manager.health = 2
			game_manager.addOneHealth()
			player.currentHealth = 3
			player.swap()
			player.position = Vector2(24, -13)
			player.has_bones = false
			game_manager.hide_F_label()
			player.secInvis()
		else:
			get_tree().change_scene_to_packed(Death_level)


func add_coin_display():
	if (add_one_coin.text == "+ 1") and (add_one_coin.visible == true):
		add_one_coin.text = "+ 2"
	elif add_one_coin.text == "+ 2" and (add_one_coin.visible == true):
		add_one_coin.text = "+ 3"
	elif add_one_coin.text == "+ 3" and (add_one_coin.visible == true):
		add_one_coin.text = "+ 4"
	elif add_one_coin.visible != true:
		add_one_coin.text = "+ 1"
		add_one_coin.visible = true
		#ssubtract_one_health.visible = true
	show_coin_addition.start()

func subtract_five_heart_display():
	subtract_five_health.visible = true
	show_subtraction_timer.start()
	
	
func add_heart_display():
	if add_one_health.visible:
		add_one_health.text = "+1"
	else:
		add_one_health.visible = true
	show_addition_timer.start()


func _on_show_subtraction_timeout() -> void:
	add_one_health.visible = false
	subtract_one_health.visible = false
	subtract_five_health.visible = false


func _on_show_addition_timeout() -> void:
	add_one_health.visible = false
	subtract_one_health.visible = false
	subtract_five_health.visible = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_show_coin_addition_timeout() -> void:
	add_one_coin.visible = false


func _on_show_damage_timeout() -> void:
	subtract_one_health_2.visible = false
