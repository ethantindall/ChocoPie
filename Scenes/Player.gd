extends KinematicBody2D

const ACCELERATION = 500
const MAX_SPEED = 150
const FRICTION = 600

var velocity = Vector2.ZERO

onready var animationPlayer = $AnimationPlayer
onready var animationTree = $AnimationTree
onready var animationState = animationTree.get("parameters/playback")
onready var BULLET = preload("res://Scenes/Bullet.tscn")


func _physics_process(delta):

	var input_vector = Vector2.ZERO
	#input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized() 
	
	if input_vector != Vector2.ZERO:
		#animationTree.set("parameters/Idle/blend_position", input_vector)
		#animationTree.set("parameters/Move/blend_position", input_vector)
		#animationState.travel("Move")
		velocity = velocity.move_toward(input_vector * MAX_SPEED, ACCELERATION * delta)
		
	else:   
		#animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
	velocity = move_and_slide(velocity)

	if Input.is_action_just_pressed("ui_right"):
		if Global.ammo >0:
			Global.ammo -=1
			var bullet =  BULLET.instance()
			bullet.transform = transform
			get_node("/root/MainScene").add_child(bullet)
			connect_to_bullet(BULLET)         #Here I conect the new Bullet
		


func connect_to_bullet(BULLET):     #Here is the function as you sad
		  BULLET.connect("Hit",self,"on_BULLET_Hit")    

func _on_BULLET_Hit():         #And here is the conection from the Bullet.
		  print("Hello")

func ouch():
	pass