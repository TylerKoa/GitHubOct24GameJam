extends Node
@onready var _2_nd_body: Node2D = $"../2ndBody"

var score = 0
var health = 5
var your_dead = false
@onready var hud: CanvasLayer = $HUD

func deadCheck():
	hud.checkIfDead()

func add_point():
	score += 1
	#Calls function inside of hud to update coin display
	hud.update_coins_display()
	hud.add_coin_display()
	print(score)

func addOneHealth():
	health += 1
	hud.update_heart_display()
	hud.add_heart_display()
	print(health)

func remove_health():
	health = health - 1
	hud.update_heart_display()
	hud.subtract_heart_display()
	hud.checkIfDead()
	print(health)

func remove_five_health():
	health -= 5
	hud.update_heart_display()
	hud.subtract_five_heart_display()

func show_F_label():
	_2_nd_body.label.visible = true
func hide_F_label():
	_2_nd_body.label.visible = false
