extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2DAnimatedSprite2D

const SPEED := 200.0

var last_direction := "down"

func _ready() -> void:
	anim.play("down")


func _physics_process(delta: float) -> void:
	var direction = Input.get_vector(
		"ui_left",
		"ui_right",
		"ui_up",
		"ui_down"
	)

	velocity = direction * SPEED
	move_and_slide()

	update_animation(direction)


func update_animation(direction: Vector2) -> void:
	# Character is standing still
	if direction == Vector2.ZERO:
		anim.stop()
		anim.frame = 0

		match last_direction:
			"left":
				anim.animation = "left"
			"right":
				anim.animation = "right"
			"up":
				anim.animation = "up"
			"down":
				anim.animation = "down"

		return

	# Character is moving
	if abs(direction.x) > abs(direction.y):
		if direction.x > 0:
			anim.animation = "right"
			last_direction = "right"
		else:
			anim.animation = "left"
			last_direction = "left"
	else:
		if direction.y > 0:
			anim.animation = "down"
			last_direction = "down"
		else:
			anim.animation = "up"
			last_direction = "up"

	if !anim.is_playing():
		anim.play()
