extends Node

var score = 0
var health = 1
var ammo = 25


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func update_score(x):
	self.score += x


func update_health(x):
	self.health += x



func restartGame():
	print("restart")
