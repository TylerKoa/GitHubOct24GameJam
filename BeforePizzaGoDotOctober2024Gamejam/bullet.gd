extends Area2D

var damage = 10

var speed = 150
var bullet_direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= bullet_direction * speed * delta
	
	pass

func _ready() -> void:
	$AnimatedSprite2D.play("default")

func _on_timer_timeout() -> void:
	queue_free()

func is_a_bullet():
	true


func _on_body_entered(body):
	
	if body.has_method("enemy"):
		body.pushback()
		queue_free()
	
