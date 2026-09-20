extends Area2D

@onready var ship = get_node("..")

var texture: Texture2D
var size: String
var shape: Shape2D
var system: String

func _ready() -> void:
	$Sprite2D.texture = texture
	$CollisionShape2D.shape = shape

func _on_mouse_entered() -> void:
	ship.targeted_coord = global_position
	ship.send_targeted_coord()
