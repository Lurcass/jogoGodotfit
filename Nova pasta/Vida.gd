extends Control
@onready var vida = $MarginContainer/HBoxContainer/Vida_contador
@onready var p_layer = $"../../PLayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	vida.text = str("Vida: %d" % p_layer.vida) #
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	vida.text = str("Vida: %d" % p_layer.vida)
