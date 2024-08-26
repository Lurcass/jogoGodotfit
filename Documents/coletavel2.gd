extends Area2D
@onready var PLayer = $"../PLayer"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	if body.name == "PLayer": 
		await $CollisionShape2D.call_deferred_thread_group("queue_free")
		$AnimatedSprite2D.play("coletado")
		await $AnimatedSprite2D.animation_finished
		queue_free()
