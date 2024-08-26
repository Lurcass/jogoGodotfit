extends Node2D

@onready var PLayer = $PLayer

# Called when the node enters the scene tree for the first time.
func _ready():
	PLayer.morreu.connect(resetGame)
	pass # Replace with function body.

# Called every frame.'delta' is the elapsed time since the previous frame.
func resetGame():
	print("reset")
	
func _process(delta):
	pass

