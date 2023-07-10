extends Node2D

var timer : Timer
func _ready():
	timer = Timer.new()
	add_child(timer)
	timer.wait_time = 2
	timer.one_shot = true
	timer.connect("timeout", _on_timer_timeout)
	timer.start()
func _on_timer_timeout():
	get_node("../Ball").start(dir)
	updScore()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if timer.time_left > 0:
		var countdown : int
		countdown = round(10*timer.time_left)
		get_node("Score").text = str(round(float(countdown)/10)+1)
		if fmod(countdown, 2) != 0 :
			get_node("../Ball/Ball").visible = false
		else:
			get_node("../Ball/Ball").visible = true
		

var score1 = 0
var score2 = 0
var dir = 1
func updScore():
	get_node("Score").text = "Score     x:y".replace("x",str(score1)).replace("y",str(score2))	
func gameOver(looser):
	match looser:
		"P1":
			score2+=1
			dir = -1
		"P2":
			score1+=1
			dir = 1
	timer.wait_time = 3
	timer.start()
