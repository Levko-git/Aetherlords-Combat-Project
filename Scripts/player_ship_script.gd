extends ship_class


func _ready() -> void:
	Layout = {"01": ["Hori", "empty", 4, 1], #coordinates are going to be multiplied by 4
			  "02": ["Vert", "empty", 1, 4], #walls are worth 4, tiles 16
			  "03": ["Vert", "empty", 3, 4],
			  "04": ["Vert", "empty", 5, 4],
			  "05": ["Hori", "empty", 8, 3],
			  "06": ["Vert", "empty", 7, 6],
			  "07": ["Large", "empty", 4, 8]}
	#spawn_rooms()
