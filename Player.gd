extends CharacterBody2D


const SPEED = 210.0
const JUMP_VELOCITY = -215.0
var Jump = false
signal morreu
var  vida = 3
var dano
var is_takingdamage
var is_dead
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
		velocity.x = move_toward(velocity.x,0,SPEED*0.08)
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
#func levouDano(dano):
#	print("Sim, levou Dano")
#	emit_signal("morreu")

func levouDano(dano):
	print("sim")
	is_takingdamage = true
	vida -= dano
	if vida <= 0:
		_morreu()
	#velocity .x = -300
	#$AnimatedSprite2D.play ("Hit")
	#await $AnimatedSprite2D.animation_finished
	#is_takingdamage = false	
	#print("vida:", vida)
	

func _morreu():
	is_dead = true
	emit_signal("morreu")
	
	if Input.is_action_just_pressed("ui_accept") and is_on_floor() and !is_takingdamage:
		velocity. y = JUMP_VELOCITY
		Jump = true 
	elif is_on_floor():
		Jump = false
	
	var direction = Input.get_axis("move_left" , "move_right")
	
	if direction and !is_takingdamage:
		velocity . x = direction * SPEED
	else:
		velocity . x = move_toward(velocity. x , 0,SPEED * 0.08)

	if is_takingdamage:
		if is_on_floor():
			if Jump:

				$AnimatedSprite2D.play("Jump")
			elif direction !=0:
				$AnimatedSprite2D.play("Run")
			elif direction ==0:
				$AnimatedSprite2D.play("Idle")
		else:
			if velocity.y < 0:
				$AnimatedSprite2D.play("Jump")
			else: 
				$AnimatedSprite2D.play("Fall") 
				
