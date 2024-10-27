extends CanvasLayer

@onready var shopkeeper_1: Sprite2D = $Panel/Shopkeeper1
@onready var panel: Panel = $Panel
@onready var anim: AnimationPlayer = $Panel/Shopkeeper1/Anim
@onready var blue_enemy: CharacterBody2D = $BlueEnemy


var coinCount = 0 
var open = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _yes():
		open = !open
		if(open == true):
			shopkeeper_1.visible = true
			panel.visible = true
		else:
			shopkeeper_1.visible = false
			panel.visible = false



func _on_button_pressed() -> void:
	blue_enemy.healthDmg += 1
	print ("bought")
	
