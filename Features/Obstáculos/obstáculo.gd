extends Area2D


@export var velocidade: float = 100
@onready var passagem: Area2D = $Passagem

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)
	passagem.body_entered.connect(_on_passagem_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.LEFT * velocidade * delta * GameManager.velocidade_multiplicador

	if position.x < -10:
		queue_free()

# Chama o método de impacto no player
func _on_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		EventBus.player_hit_obstacle.emit()


func _on_passagem_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		EventBus.player_passed_obstacle.emit()