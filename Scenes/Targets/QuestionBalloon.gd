extends Target

class_name QuestionBalloon


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var frames = 1
var counter = 5
var bounceSpeed =25

# Called when the node enters the scene tree for the first time.
func _ready():
	pointValue = 1
	damage = 10
	rotateSpeed = 0

	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#self.global_position[0] -= 0
	if $AnimationPlayer.is_playing() == false:
		$AnimationPlayer.play("Float")
	if frames == 1 && counter ==0:
		self.global_position[1]+=2
		counter =bounceSpeed
		frames = 2
	if frames == 2 && counter ==0:
		self.global_position[1]-=2
		counter =bounceSpeed
		frames = 1
	counter -=1



func _on_Area2D_body_entered(body):
	if body.has_method("ouch") or body.name =="Backstop":
		queue_free()
		Global.update_health(-damage)
		if body.has_method("ouch"):
			body.ouch()
	if body.has_method("bullet"):
		body.bullet()
		$AnimationPlayer.play("Pop")
		yield($AnimationPlayer, "animation_finished")
		Global.update_score(pointValue)
		queue_free()
		Global.quizTime = true
		
