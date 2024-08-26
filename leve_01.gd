extends Node2D

@onready var p_layer = $PLayer
@onready var pause = $pause
var resetgame

func _ready():
	p_layer.morreu.connect(resetGame)
	#pause.reiniciar.connect(resetgame)
	pass
	


# Called every frame.'delta' is the elapsed time since the previous frame.
func resetGame():
	print("reset")
	get_tree().reload_current_scene()


func _process(delta):
	pass

