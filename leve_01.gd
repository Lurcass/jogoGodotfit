extends Node2D

@onready var p_layer = $PLayer
@onready var pause = $pause
var resetgame
var resetpontos

func _ready():
	Global.pts = 0
	p_layer.morreu.connect(resetGame)
	#pause.reiniciar.connect(resetgame)
	pass
	


# Called every frame.'delta' is the elapsed time since the previous frame.
func resetGame():
	print("reset")
	get_tree().reload_current_scene()


	# Print the message "pontos" before reloading the scene
	


func _process(delta):
	pass

