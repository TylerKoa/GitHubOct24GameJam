extends CharacterBody2D

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@export var target: controller
@onready var knight_player: controller = $"../KnightPlayer"

const SPEED = 100
const JUMP_VELOCITY = 250


func _physics_process(delta: float) -> void:
	calculate_velocity()
	move_and_slide()

func calculate_velocity():
	var distanceToTarget = 10
	var targetPosition = knight_player.position - Vector2(-5, 0)
	if position.distance_to(targetPosition) > distanceToTarget:
		var direction = (targetPosition - position).normalized()
		velocity = direction * SPEED
		velocity.y *= 3
	elif position.y - targetPosition.y < -3 || position.y - targetPosition.y > 3:
		velocity.y += 10
		velocity.x - 0
	else:
		velocity = Vector2.ZERO
