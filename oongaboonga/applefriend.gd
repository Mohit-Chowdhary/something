extends Area2D

signal do

onready var scorelabel=$"../Label"

var rand=Vector2(0,0)
var size=0

signal increase()

func _ready():
	pass # Replace with function body.


func onbodyentered(body):
	print(body)
	size+=1
	scorelabel.text="Score: %d" % size
	rand.y=rand_range(1.5,18)
	rand.x= rand_range(1,31)
	self.global_position=Vector2(32*rand.x,32*rand.y)
