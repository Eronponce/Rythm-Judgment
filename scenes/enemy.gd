extends CharacterBody2D
@onready var sprite = $AnimatedSprite2D
@export var movement_speed = 20.00
@export var hp = 10
@onready var player = get_tree().get_first_node_in_group("player")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction*movement_speed
	
	move_and_slide()
# Flip the character based on the direction
	if direction.x >0.01:
		sprite.flip_h = true
	elif direction.x < -0.1:
		sprite.flip_h = false




func _on_hurt_box_hurt(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
