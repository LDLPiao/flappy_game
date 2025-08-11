extends Node


var score: int = 0
var _started: bool = false

var velocidade_multiplicador: float = 1.0
var timer_multiplicador: float = 1.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS
	# Inicia o jogo pausado para o jogador
	get_tree().paused = true

	# Conecta os sinais importantes para o funcionamento do jogo
	EventBus.player_hit_obstacle.connect(on_player_hit_obstacle)
	EventBus.player_passed_obstacle.connect(on_player_passed_obstacle)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if not _started:
		if Input.is_action_pressed("start"):
			_started = true
			get_tree().paused = false
			EventBus.game_started.emit()
			return

	if Input.is_action_just_pressed("menu"):
		get_tree().paused = !get_tree().paused
	

func on_player_hit_obstacle() -> void:
	get_tree().quit()


func on_player_passed_obstacle() -> void:
	score += 1
	velocidade_multiplicador += 0.05
	timer_multiplicador += 0.0005