extends CharacterBody2D

#@onready var animation: AnimationPlayer = $AnimationPlayer
#@onready var anim_cooldown: Timer = $AnimCooldown
@onready var label: Label = $Sprite2D/Label
@onready var shop: CanvasLayer = $Shop


var idle = true
var buy = false
var open = false


func _physics_process(delta: float) -> void:
	pass

#func _on_detection_area_area_entered(area: Area2D) -> void:

	#while(buy == false && idle == true):
		#animation.play("idle")
		#idle = false
		#print("STARTED")
		#anim_cooldown.start()

#
#func _on_detection_area_area_exited(area: Area2D) -> void:
	##animation.stop()




#func _on_anim_cooldown_timeout() -> void:
	#idle = true
	#print("ENDED")



func _on_area_2d_body_entered(body: Node2D) -> void:
	label.visible = true
	if (Input.is_action_just_pressed("open")):
		get_node("Shop/Anim").play("Idle")
		get_node("Shop")._yes()



func _on_area_2d_body_exited(body: Node2D) -> void:
	label.visible = false
