extends CharacterBody2D

const SPEED = 300
var current_direction = "down"

func _ready():
	$AnimatedSprite2D.play("idle down")

func _physics_process(float):
	player_movement()

func player_movement():
	if Input.is_action_pressed("ui_left"):
		current_direction = "left"
		play_animation(1)
		velocity.x = -SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_right"):
		play_animation(1)
		current_direction = "right"
		velocity.x = SPEED
		velocity.y = 0
	elif Input.is_action_pressed("ui_up"):
		play_animation(1)
		current_direction = "up"
		velocity.x = 0
		velocity.y = SPEED
	elif Input.is_action_pressed("ui_down"):
		play_animation(1)
		current_direction = "down"
		velocity.x = 0
		velocity.y = -SPEED
	else:
		play_animation(0)
		velocity.x = 0
		velocity.y = 0
		
	print(velocity.x)
	print(velocity.y)
	move_and_slide()
	
	
func play_animation(movement):
	var direction = current_direction
	var animation = $AnimatedSprite2D
	if direction == "right":
		animation.flip_h = false
		if movement == 1:
			animation.play("walking right")
		elif movement == 0 :
			animation.play("idle right")
	if direction == "left":
		animation.flip_h = true
		if movement == 1:
			animation.play("walking left")
		elif movement == 0 :
			animation.play("idle left")
	if direction == "up":
		animation.flip_h = true
		if movement == 1:
			animation.play("walking up")
		elif movement == 0 :
			animation.play("idle up")
	if direction == "down":
		animation.flip_h = true
		if movement == 1:
			animation.play("walking down")
		elif movement == 0 :
			animation.play("idle down")
