extends Node2D
class_name ship_class

var Ship_type: String  
var HP : int
var Weapon_attach_points: Dictionary[String, Vector2]
var Weapon_list: Dictionary[int, Array]
var Layout: Dictionary[String, Array] #Layout = {"id": ["size", "system", coordX, coordY], ... }

var is_player = false

var in_duel = false
var duel : Node2D
signal updating_targeted_coord()
var targeted_coord : Vector2
var targeting_coords : Vector2

func _ready() -> void:
	pass

func battle_started():
	duel = get_node("..")
	updating_targeted_coord.connect(duel.update_targeted_coord)
	spawn_rooms()
	in_duel = true

func send_targeted_coord():
	updating_targeted_coord.emit(self, targeted_coord)

func spawn_rooms():
	var rooms = load("res://Scenes/room_scene.tscn")
	var lSprite = load("res://Sprites/Sprite_large_room.png")
	var hSprite = load("res://Sprites/Sprite_horizontal_room.png")
	var vSprite = load("res://Sprites/Sprite_vertical_room.png") 
	var lShape = load("res://Classes&Resources/l_room_shape2D.tres")
	var hShape = load("res://Classes&Resources/l_room_shape2D.tres")
	var vShape = load("res://Classes&Resources/l_room_shape2D.tres")
	var tileHalf_size = 25
	for rm in Layout:
		var room = rooms.instantiate()
		var size = Layout[rm][0]
		var texture: Texture2D
		var shape: Shape2D
		match size:
			"Large":
				texture = lSprite
				shape = lShape
			"Hori":
				texture = hSprite
				shape = hShape
			"Vert":
				texture = vSprite
				shape = vShape
		room.size = size
		room.texture = texture
		room.shape = shape
		room.system = Layout[rm][1]
		room.position.x = Layout[rm][2] * tileHalf_size
		room.position.y = Layout[rm][3] * tileHalf_size
		add_child(room)
