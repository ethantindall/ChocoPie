extends Node2D

var ChocoPie = preload("res://Scenes/Targets/ChocoPie.tscn")
var QuestionBalloon = preload("res://Scenes/Targets/QuestionBalloon.tscn")
var score = 0
var timerSpeed = 0.1
var stopWatchTimeElapsed =0.0
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$PieTimer.wait_time = timerSpeed


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):


	if Global.health <= 0:
		#var new_pause_state = not get_tree().paused
		#get_tree().paused = new_pause_state

		$Stats/HealthNode/HealthBar.value = 0
		#get_tree().paused = true;

		$GameOver.show()
	
func _on_Timer_timeout():
	var nums = randi() %100
	var spawnHeight = int(round(rand_range(20, 170)))
	
	if nums < 90:
		var pie = ChocoPie.instance()
		pie.position = Vector2(330,spawnHeight)
		add_child(pie)
	else:
		var balloon = QuestionBalloon.instance()
		balloon.position = Vector2(330, spawnHeight)
		add_child(balloon)

