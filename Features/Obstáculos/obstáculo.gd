extends Area2D


@export var velocidade: float = 100

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	body_entered.connect(_on_body_entered)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += Vector2.LEFT * velocidade * delta

	if position.x < -10:
		queue_free()

	

# Chama o método de impacto no player
func _on_body_entered(body: Node2D) -> void:
	if body.has_method("on_hit_obstacle"):
		body.on_hit_obstacle()

