extends CharacterBody2D

@export var playerspeed = 1000

func _process(delta):
	velocity.y = playerspeed*(-int(Input.is_action_pressed(name+"_move_up")) + int(Input.is_action_pressed(name+"_move_down")))	
	if ((velocity.y >= 0 and position.y + get_node(name+" Paddle").size.y >= 1080-20) or 
	(velocity.y <= 0 and position.y <= 0+20)):
		velocity.y = 0
	move_and_slide()
