extends CharacterBody2D

@onready var SM = $StateMachine


const SPEED = 300.0
const JUMP_VELOCITY = -50.0
const MAX_JUMP = -600.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var direction = 1

func _ready():
	up_direction = Vector2.UP

func _physics_process(_delta):
	if direction < 0 and not $AnimatedSprite2D.flip_h: $AnimatedSprite2D.flip_h = true
	if direction > 0 and $AnimatedSprite2D.flip_h: $AnimatedSprite2D.flip_h = false
	if position.y > 1000:			#fell off the world
		queue_free()
	
	
func set_direction(d):
	direction = d

func set_animation(anim):
	if $AnimatedSprite2D.animation == anim: return
	if $AnimatedSprite2D.sprite_frames.has_animation(anim): $AnimatedSprite2D.play(anim)
	else: $AnimatedSprite2D.play()

func die():
	queue_free()
