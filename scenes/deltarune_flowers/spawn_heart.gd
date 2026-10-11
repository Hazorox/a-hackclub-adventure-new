extends TextureRect

const colors= [
	Color("ff8a00"),
	Color("ffe000"),
	Color("2ecc40"),
	Color("00d8ff"),
	Color("2e5bff"),
	Color("a020f0"),
]
func _ready() -> void:
	modulate = colors[int(name)-1]
