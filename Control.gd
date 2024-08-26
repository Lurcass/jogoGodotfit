extends Control
@onready var Timer_count = $MarginContainer/HBoxContainer/Time_count as Label
@onready var contador_melons = $MarginContainer/pontos_contador/contador_melons as Label
@onready var timer = $Timer_cont as Timer

signal tempo_acabou() # para recarregar no mundo

var minutos = 0
var segundos = 0

#limitar o tempo
@export_range(0,2) var min_padrao = 1
@export_range(0,59) var seg_padrao = 0

func _ready():# faz uma vez
	contador_melons.text = str("%03d" % Global.pts) #puxar contador de melancia 
	Timer_count.text = str("%02d" % min_padrao) + ":" + str("%02d" % seg_padrao)
	minutos = min_padrao
	segundos = seg_padrao 

func _process(delta): #rodar para sempre
	contador_melons.text = str("%03d" % Global.pts)
	if minutos == 0 && segundos == 0:
		emit_signal("tempo_acabou") # avisar que acabou o tempo
		



func _on_timer_cont_timeout():
	if segundos == 0:
		if minutos >0:
			minutos -=1
			segundos = 60
			
	segundos -=1
	
	Timer_count.text = str("%02d" % minutos) + ":" + str("%02d" % segundos)
	pass # Replace with function body.
