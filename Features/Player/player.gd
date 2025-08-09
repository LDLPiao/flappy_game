extends CharacterBody2D


const JUMP_VELOCITY = -250.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()


func _on_area_2d_body_entered(_body:Node2D) -> void:
	on_hit_obstacle()


func on_hit_obstacle() -> void:
		get_tree().quit()
