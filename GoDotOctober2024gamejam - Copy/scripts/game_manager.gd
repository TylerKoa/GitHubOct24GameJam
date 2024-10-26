extends Node

var score = 0
@onready var hud: CanvasLayer = $HUD

func add_point():
	score += 1
	#Calls function inside of hud to update coin display
	hud.update_coins_display()
	print(score)
