extends Node2D

var ChocoPie = preload("res://Scenes/Targets/ChocoPie.tscn")
var QuestionBalloon = preload("res://Scenes/Targets/QuestionBalloon.tscn")
var score = 0
var timerSpeed =.7


# Called when the node enters the scene tree for the first time.
func _ready():
	$PieTimer.wait_time = timerSpeed
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Global.quizTime == true:
		get_tree().paused = true
		$Quiz.visible = true
	if Global.quizTime == false:
		get_tree().paused = false
		$Quiz.visible = false
		
	if Global.health <= 0:
		#var new_pause_state = not get_tree().paused
		#get_tree().paused = new_pause_state

		$Stats/HealthNode/HealthBar.value = 0
		#get_tree().paused = true;
		get_tree().paused = true
		$GameOver.show()
	if Global.questionsAnswered == 28:
		get_tree().paused = true
		$GameOver.show()
		$GameOver/Control/Panel/Panel/RestartButton.text = "집에 돌아가다"
		$GameOver/Control/Panel/WinLossMessage.text = "승리"
		$GameOver/Panel3/SLmessage.text = "잘했어, 동무. 고마워."
	
func _on_Timer_timeout():
	var nums = randi() %100
	var spawnHeight = int(round(rand_range(20, 170)))
	
	if nums < 92:
		var pie = ChocoPie.instance()
		pie.position = Vector2(330,spawnHeight)
		add_child(pie)
	else:
		var balloon = QuestionBalloon.instance()
		balloon.position = Vector2(330, spawnHeight)
		add_child(balloon)

