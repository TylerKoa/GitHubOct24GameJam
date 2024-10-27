extends Node
@onready var _2_nd_body: Node2D = $"../2ndBody"
@onready var second_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var label_2: Label = $AnimatedSprite2D/Area2D/Label2
@onready var label_2_timer: Timer = $AnimatedSprite2D/Area2D/label2Timer
@onready var player: controller = $"../Player"




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

func show_smallF_label():
	#_2_nd_body2.label_2.visible = true
	pass
func hide_smallF_label():
	#_2_nd_body2.label_2.visible = false
	pass


func object_move_to_player(object):
	var objectSpeed = 100
	object.position += (player.position - object.position)/objectSpeed
