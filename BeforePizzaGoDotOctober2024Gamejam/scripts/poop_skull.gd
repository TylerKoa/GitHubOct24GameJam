extends Node2D
@onready var skelly: Node2D = $"../../2ndBody"



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.
var inside = false
var moved = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("swap") and inside == true:
		skelly.position = position
		moved = true
	if moved == true:
		self.visible = false




func _on_area_2d_body_entered(body: Node2D) -> void:
	print("Im inside")
	inside = true

func _on_area_2d_body_exited(body: Node2D) -> void:
	inside = false
