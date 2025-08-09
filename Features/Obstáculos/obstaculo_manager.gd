extends Node

@onready var timer: Timer = $Timer
@onready var obstaculo = preload("res://Features/Obstáculos/obstáculo.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)


# Usada para instanciar os obstáculos no sinal de timeout
func _on_timer_timeout() -> void:
	var _obstaculo = obstaculo.instantiate()

	var _y_pos: float = 168 + randfn(0, 4)*10
	var _position: Vector2 = Vector2(350.0, _y_pos)

	_obstaculo.position = _position
	
	add_child(_obstaculo, true)
