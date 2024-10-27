extends CharacterBody2D

@onready var animation: AnimationPlayer = $AnimationPlayer
@onready var anim_cooldown: Timer = $AnimCooldown


var idle = true
var buy = false


func _physics_process(delta: float) -> void:
	pass

func _on_detection_area_area_entered(area: Area2D) -> void:
	print("In Range")
	while(buy == false && idle == true):
		animation.play("idle")
		idle = false
		print("STARTED")
		anim_cooldown.start()


func _on_detection_area_area_exited(area: Area2D) -> void:
	animation.stop()
	print("out of range")


func _on_anim_cooldown_timeout() -> void:
	idle = true
	print("ENDED")
