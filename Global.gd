extends Node

var score = 0
var maxHealth = 100
var health = maxHealth
var ammo = 20


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
