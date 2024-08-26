extends Control
@onready var item_coletavel = $MarginContainer/HBoxContainer/item_coletavel


# Called when the node enters the scene tree for the first time.
func _ready():# faz uma vez
	item_coletavel.text = str(Global.pts)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta): #rodar para sempre
	item_coletavel.text = str(Global.pts)
	pass
