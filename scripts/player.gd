extends CharacterBody2D

const SPEED = 300.0
var hp = 80
@onready var sprite = $AnimatedSprite2D
func _physics_process(delta):
	# Get the input direction for both horizontal and vertical movement
	var direction = Vector2(
		Input.get_axis("ui_left", "ui_right"),
		Input.get_axis("ui_up", "ui_down")
	).normalized()
	
	# Calculate velocity based on the direction and speed
	velocity = direction * SPEED
	if velocity.length() > 0:
		if not sprite.is_playing():
			sprite.play()
	else:
		if sprite.is_playing():
			sprite.stop()

	# Move the character and slide along collisions
	move_and_slide()

	# Flip the character based on the direction
	if direction.x >0:
		sprite.flip_h = true
	elif direction.x <0:
		sprite.flip_h = false


func _on_hurt_box_hurt(damage):
	hp -= damage
	print(hp)
