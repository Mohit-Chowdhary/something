extends Node2D


export var main:PackedScene



func _on_playagain_button_up():
	get_tree().change_scene(main.resource_path)
