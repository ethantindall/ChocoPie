extends KinematicBody2D

var movement = Vector2(0,0)
var speed = 150
signal Hit


func _ready():
	emit_signal("Hit")     #This is the signal for the Player


func _physics_process(delta):
	movement = Vector2(speed,0)
	move_and_collide(movement * delta)
	
func bullet():
	pass


func _on_Area2D_body_entered(body):
	if body.name == "Backstop2":
		queue_free()

