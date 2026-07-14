extends CharacterBody2D

@onready var anim: AnimatedSprite2D = $AnimatedSprite2DAnimatedSprite2D

func _ready() -> void:
	anim.play("down")
