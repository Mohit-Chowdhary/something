extends Node2D

var rand=Vector2(0,0)


func spen():
	#var spawn=preload("res://applefriend.tscn").instance()
	var spawn=$boy
	add_child(spawn)
	rand.y=rand_range(1,18)
	rand.x= rand_range(1,31)
	spawn.global_position=Vector2(32*rand.x,32*rand.y)
	add_child(spawn)


func _ready():
	pass
