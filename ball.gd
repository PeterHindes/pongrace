extends CharacterBody2D

@export var verticalScaling = 2
var gameController : Node2D

func _ready():
	gameController = get_node("../Game Controller")
	
func start(dir):
	position=Vector2(700,520)
	velocity.x = 500*dir
	move_and_slide()

func _process(delta):
	if (position.y <= 0):
		velocity.y *= -1
	if (position.y >= 1080-40):
		velocity.y *= -1
	move_and_slide()
	if (position.x <= 0):
		gameController.gameOver("P1")
		position.x = 1
		velocity = Vector2.ZERO
	if (position.x >= 1440-40):
		gameController.gameOver("P2")		
		position.x = 1440-40-1
		velocity = Vector2.ZERO

func get_center_2(rect : ColorRect):
	return (rect.size.y / 2)

func get_center(body):
	return (get_center_2(body.get_node(body.name+" Paddle")) + body.position.y)

func _on_area_2d_body_entered(body):
	if body.name != "Ball":
		print_debug(body.name)
		if body.name == "Player1" or body.name == "Player2":
			velocity.x *= -1
			velocity.y = verticalScaling*(position.y+20 - get_center(body)) # = if above + if below
		elif body.name == "Sides":
			velocity.y *= -1
