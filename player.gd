extends Area2D

var angular_speed = PI
@export var speed = 600 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

func _ready():
	screen_size = get_viewport_rect().size
	hide()
	
func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector. \
	#if any input
	if  Input.is_action_pressed(&"move_right") || Input.is_action_pressed(&"move_left") || Input.is_action_pressed(&"move_down") ||Input.is_action_pressed(&"move_up"):
		if Input.is_action_pressed(&"move_right"):
			velocity.x += 1
		if Input.is_action_pressed(&"move_left"):
			velocity.x -= 1
		if Input.is_action_pressed(&"move_down"):
			velocity.y += 1
		if Input.is_action_pressed(&"move_up"):
			velocity.y -= 1
	#if no input return to center
	else:
		if position.x > 500:
			velocity.x -= 1
		if position.x < 480:
			velocity.x += 1
		if position.y > 500:
			velocity.y -= 1
		if position.y < 480:
			velocity.y += 1
		
	

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
