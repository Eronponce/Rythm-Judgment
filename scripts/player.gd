extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	# Get the input direction for both horizontal and vertical movement
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	
	# Calculate velocity based on the direction and speed
	velocity = direction * SPEED

	# Move the character and slide along collisions
	move_and_slide()
