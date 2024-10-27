extends Area2D

var damage = 10

var speed = 150
var bullet_direction

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position -= bullet_direction * speed * delta
	
	pass


func _on_timer_timeout() -> void:
	queue_free()

func _init() -> void:
	collision_layer = 2
	collision_mask = 0
	
