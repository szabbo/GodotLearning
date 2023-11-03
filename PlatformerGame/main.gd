extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
#	Utils.save_game()
	Utils.load_game()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	Utils.save_game()
	get_tree().quit()


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
