extends KinematicBody2D

onready var anim=$AnimatedSprite

var speed = 15000

var direction = Vector2.ZERO

var lastkey=""

func _input(event):
	if event.is_action_pressed("up") and direction!=Vector2(0,1):#checks if the player isnt facing oppisite direction currently, else it would lead to a 180 degree turn
		direction.y = -1
		direction.x = 0
		lastkey="up"
		
	if event.is_action_pressed("down") and direction!=Vector2(0,-1):
		direction.y = 1
		direction.x = 0
		lastkey="down"
	if event.is_action_pressed("left") and direction!=Vector2(1,0):
		direction.x = -1
		direction.y = 0
		lastkey="left"
	if event.is_action_pressed("right") and direction!=Vector2(-1,0):
		direction.x = 1
		direction.y = 0
		lastkey="right"
	if event.is_action_pressed("q") and direction!=Vector2(0.7,0.7) and lastkey!="c":
		direction.y = -0.7
		direction.x = -0.7
		lastkey="q"
	if event.is_action_pressed("e") and direction!=Vector2(-0.7,0.7) and lastkey!="z":
		direction.y = -0.7
		direction.x = 0.7
		lastkey="e"
	if event.is_action_pressed("z") and direction!=Vector2(0.7,-0.7) and lastkey!="e":
		direction.x = -0.7
		direction.y = 0.7
		lastkey="z"
	if event.is_action_pressed("x") and direction!=Vector2(-0.7,-0.7) and lastkey!="q":
		direction.x = 0.7
		direction.y = 0.7
		lastkey="c"

func _physics_process(delta):
	anim.play(lastkey)
	if direction != Vector2.ZERO:
		direction = direction.normalized()
		if is_on_wall():
			get_tree().change_scene("res://end.tscn")
			print("WALLBALL")

	move_and_slide(direction * speed * delta)
