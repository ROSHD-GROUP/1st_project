extends CharacterBody2D


var speed = 0
var can_drive = false
@onready var animated_sprite_2D =$AnimatedSprite2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
func _ready(): 
	# Initialization code here 
	pass
func _physics_process(delta):
	if can_drive:
		move_car()
		move_and_slide()

func move_car():
	if can_drive:
		speed = speed* 0.99
	if Input.is_action_pressed("ui_right"):
		rotate(0.1)
	if Input.is_action_pressed("ui_left"):
		rotate(-0.1)
		
	if Input.is_action_pressed("ui_up"):
		if speed < 6:
			speed += 0.1
	if Input.is_action_pressed("ui_down"):
		if speed > -2:
			speed -= 0.1
			
			
	position += speed * Vector2.from_angle(rotation)
	
