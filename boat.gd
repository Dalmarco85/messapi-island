extends Node2D

@export var speed: float = 60.0
@export var target_y: float = 430.0

func _process(delta):
    position.y += speed * delta
    if position.y >= target_y:
        queue_free() # Reached shore; in a full game you'd spawn enemies here.
