extends CharacterBody2D

@export var speed: float = 140.0
var move_dir := Vector2.ZERO

func _physics_process(delta):
    move_dir = Vector2.ZERO
    # Keyboard
    if Input.is_action_pressed("ui_up"):
        move_dir.y -= 1
    if Input.is_action_pressed("ui_down"):
        move_dir.y += 1
    if Input.is_action_pressed("ui_left"):
        move_dir.x -= 1
    if Input.is_action_pressed("ui_right"):
        move_dir.x += 1
    # Normalize and move
    if move_dir.length() > 0:
        move_dir = move_dir.normalized()
    velocity = move_dir * speed
    move_and_slide()
