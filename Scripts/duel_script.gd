extends Node2D

var Attacker_Scene = load("res://Scenes/player_ship_scene.tscn")
var Defender_Scene = load("res://Scenes/enemy_ship_scene.tscn")
var Attacker
var Defender

signal battle_beginning()

func _ready() -> void:
	Attacker = instantiate_ships(Attacker_Scene, Vector2(100, 100))
	Defender = instantiate_ships(Defender_Scene, Vector2(700, 100))
	battle_beginning.emit()

func instantiate_ships(ship, ship_position) -> Node2D:
	var Ship = ship.instantiate()
	Ship.position = ship_position
	battle_beginning.connect(Ship.battle_started)
	add_child(Ship)
	return Ship

func update_targeted_coord(ship, targeted_coords):
	if ship == Attacker:
		Defender.targeting_coords = targeted_coords
		print(Defender, targeted_coords)
	else:
		Attacker.targeting_coords = targeted_coords
		print(Attacker, targeted_coords)

#func _process(delta: float) -> void:
	#pass
