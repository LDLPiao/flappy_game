extends CharacterBody2D


const JUMP_VELOCITY = -250.0


func _ready() -> void:
	EventBus.game_started.connect(on_game_started)

func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()


func _on_area_2d_body_entered(_body:Node2D) -> void:
	EventBus.player_hit_obstacle.emit()

func on_game_started() -> void:
	velocity.y = JUMP_VELOCITY