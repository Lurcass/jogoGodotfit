extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var Jump = false

signal morreu
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		Jump = true
	elif is_on_floor():
		Jump = false
		
	var direction = Input.get_axis("move_left","move_right")
	if direction:
		velocity.x = direction * SPEED
		$AnimatedSprite2D.scale.x = direction
	else:
		velocity.x = move_toward(velocity.x,0,SPEED*0.06)
#Animação 
	if is_on_floor(): # Se está no chão
		if Jump: # Se está pulando
			$AnimatedSprite2D.play ("Jump")
			
			
		elif direction !=0: #movimento
			
			$AnimatedSprite2D.play("Run")
		elif direction ==0: #parado
			$AnimatedSprite2D.play ("Idle")
	else: #Não está no chão 
		if velocity.y < 0: #movimento em y negativo 
			$AnimatedSprite2D.play("Jump")
		else: #Movimento em Y Negativo
			$AnimatedSprite2D.play("Fall")


	move_and_slide()
func levouDano():
	print("Sim, levou Dano")
	emit_signal("morreu")
