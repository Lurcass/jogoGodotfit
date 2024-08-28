extends CanvasLayer
@onready var leve_01 = $Control/iniciar/pause_menu/resetar
var game_paused = false

func _ready():
	visible = false #menu invisivel 
	pass 
func _on_bt_quit_pressed():
	get_tree().quit() #kitar do jogo
	visible = false
func _on_bt_voltar_pressed():
	get_tree().paused = false
	visible = false
func _on_bt_reniciar_pressed():
	get_tree().paused = false
	emit_signal("resetou")
	visible = false
	leve_01._resetar()
func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		game_paused = !game_paused
		get_tree().paused = game_paused #pausar o game
		visible = game_paused


