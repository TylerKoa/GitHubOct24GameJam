extends Node
@onready var _2_nd_body: Node2D = $"../2ndBody"
@onready var second_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var label_2: Label = $AnimatedSprite2D/Area2D/Label2
@onready var label_2_timer: Timer = $AnimatedSprite2D/Area2D/label2Timer
@onready var start_level = preload("res://scenes/Victory_Screen.tscn") as PackedScene




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
	if score >= 15:
		get_tree().change_scene_to_packed(start_level)
	print(score)

func subtract_enemy_one():
	hud.hudSubtract_enemy_one()

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

"""
func object_move_to_player(object):
	var objectSpeed = 100
	object.position += (player.position - object.position)/objectSpeed
	var distanceBetweenObjectPerson = player.position-object.position
	if (distanceBetweenObjectPerson[0] > -5 || distanceBetweenObjectPerson[1] < 5):
		if Input.is_action_just_pressed("attack"):
			print("GET BACK!!")
			object.position[0] -= 12
			object.position[1] -= 12
		print("Close to player")
	else:
		print("not close")
"""
