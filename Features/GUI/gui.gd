extends CanvasLayer

var pontos: int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.player_passed_obstacle.connect(on_player_passed_obstacle)
	EventBus.game_started.connect(on_game_started)

func on_player_passed_obstacle() -> void:
	pontos += 1
	%Label.text = str(pontos)

func on_game_started() -> void:
	pontos = 0
	%Label.text = str(pontos)

	$Control/CenterContainer2.hide()