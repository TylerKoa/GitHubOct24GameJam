extends Node

var score = 0
var health = 5
@onready var hud: CanvasLayer = $HUD
var player_current_attack = false

func add_point():
	score += 1
	#Calls function inside of hud to update coin display
	hud.update_coins_display()
	print(score)

func remove_heal():
	health -= 1
	hud.update_heart_display()
