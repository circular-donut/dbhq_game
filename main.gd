extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	$player.start($start_position.position)
	$game_music.play()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
