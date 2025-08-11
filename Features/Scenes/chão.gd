extends Node


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.player_passed_obstacle.connect(on_player_passed_obstacle)


func on_player_passed_obstacle() -> void:
	$Parallax2D.autoscroll.x = -100 * GameManager.velocidade_multiplicador