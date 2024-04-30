extends CharacterBody2D


const SPEED = 500.0
const JUMP_VELOCITY = -800.0
const FRICTION = 30

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var jump_wall_plus: bool = true

@onready var sprite_2d = $Sprite2D
@onready var jump_audio = %Audio/Jump


func _physics_process(delta):
	#change animation when run and idle
	if (velocity.x > 1 || velocity.x < -1):
		sprite_2d.animation = "run"
	else:
		sprite_2d.animation = "idle"

	handleJumpAndGravity(delta)
	
	#get direction and move player
	var direction = Input.get_axis("left", "right")
	if direction:
		if direction < 0:
			sprite_2d.flip_h = true
		else:
			sprite_2d.flip_h = false
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, 20)
		
	move_and_slide()
	
	

func handleJumpAndGravity(delta):
	#add gravity for character
	if  !is_on_floor():
		velocity.y += gravity * delta
		if(is_on_wall() && velocity.y > 0):
			velocity.y -= FRICTION
		if(velocity.y < 0):
			sprite_2d.animation = "jump"
		else:
			sprite_2d.animation = "fall"
	else :
		jump_wall_plus = true
		jump_count = 1
	
	#set jumpwall
	if(!is_on_floor() && !is_on_wall()):
		jump_wall_plus = true
	
	#active jump wall
	if(is_on_wall() && !is_on_floor()):
		sprite_2d.animation = "wall jump"
		if(jump_wall_plus):
			jump_count += 1
			jump_wall_plus = false
	if Input.is_action_just_pressed("jump") && jump_count > 0:
		jump_audio.play()
		velocity.y = JUMP_VELOCITY
		jump_count -= 1
	
	
