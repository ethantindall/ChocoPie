extends KinematicBody2D

class_name Target
# Declare member variables here. Examples:
#var spawnHeight = int(round(rand_range(10, 170)))
#var spawnAngle = int(round(rand_range(170, 190)))
var rotateSpeed = int(round(rand_range(1, 5)))

var pointValue = 1
var damage = 1
# Called when the node enters the scene tree for the first time.
#func _ready():
#	global_position = Vector2(330,spawnHeight)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.global_position[0] -= 1
	self.rotation_degrees -= rotateSpeed
	
	

func _on_Area2D_body_entered(body):
	if body.has_method("bullet"):
		queue_free()
		Global.update_score(pointValue)


	if body.has_method("ouch") or body.name =="Backstop":
		queue_free()
		Global.update_health(-damage)

