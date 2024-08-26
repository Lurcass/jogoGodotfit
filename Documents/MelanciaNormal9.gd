extends Area2D
var pts = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "PLayer": 
		$AnimatedSprite2D.play ("Coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free()
		Global.pts+=pts
		print(Global.pts)
pass # Replace with function body.
